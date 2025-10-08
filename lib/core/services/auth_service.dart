import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../network/dio_client.dart';
import '../network/api_constants.dart';
import '../models/auth_models.dart';
import '../models/user_model.dart';

class AuthService {
  final DioClient _dioClient;
  final FlutterSecureStorage _secureStorage;

  AuthService(this._dioClient, this._secureStorage);

  // Login
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.login,
        data: request.toJson(),
      );

      final loginResponse = LoginResponse.fromJson(response.data);
      
      // Save token securely
      await _secureStorage.write(key: 'auth_token', value: loginResponse.token);
      await _secureStorage.write(key: 'user_id', value: loginResponse.user.id.toString());
      await _secureStorage.write(key: 'user_email', value: loginResponse.user.email);

      return loginResponse;
    } catch (e) {
      rethrow;
    }
  }

  // Register
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.register,
        data: request.toJson(),
      );

      final registerResponse = RegisterResponse.fromJson(response.data);
      
      // Save user email for verification
      await _secureStorage.write(key: 'pending_email', value: registerResponse.user.email);

      return registerResponse;
    } catch (e) {
      rethrow;
    }
  }

  // Send verification code
  Future<ApiResponse> sendVerificationCode(String email) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.verifyEmail,
        data: EmailVerificationRequest(email: email).toJson(),
      );

      return ApiResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // Confirm email with code
  Future<ApiResponse> confirmEmail(String email, String code) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.confirmEmail,
        data: EmailConfirmationRequest(email: email, code: code).toJson(),
      );

      // Clear pending email after successful verification
      await _secureStorage.delete(key: 'pending_email');

      return ApiResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // Resend verification code
  Future<ApiResponse> resendVerificationCode(String email) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.resendVerification,
        data: EmailVerificationRequest(email: email).toJson(),
      );

      return ApiResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // Get profile
  Future<UserModel> getProfile() async {
    try {
      final response = await _dioClient.get(ApiConstants.profile);
      final profileResponse = ProfileResponse.fromJson(response.data);
      return profileResponse.user;
    } catch (e) {
      rethrow;
    }
  }

  // Enable Face ID
  Future<UserModel> enableFaceId(bool enabled) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.enableFaceId,
        data: {'enabled': enabled},
      );

      final profileResponse = ProfileResponse.fromJson(response.data);
      return profileResponse.user;
    } catch (e) {
      rethrow;
    }
  }

  // Enable Fingerprint
  Future<UserModel> enableFingerprint(bool enabled) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.enableFingerprint,
        data: {'enabled': enabled},
      );

      final profileResponse = ProfileResponse.fromJson(response.data);
      return profileResponse.user;
    } catch (e) {
      rethrow;
    }
  }

  // Setup biometrics (both Face ID and Fingerprint)
  Future<UserModel> setupBiometrics({
    required bool faceIdEnabled,
    required bool fingerprintEnabled,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.setupBiometrics,
        data: BiometricSetupRequest(
          faceIdEnabled: faceIdEnabled,
          fingerprintEnabled: fingerprintEnabled,
        ).toJson(),
      );

      final profileResponse = ProfileResponse.fromJson(response.data);
      return profileResponse.user;
    } catch (e) {
      rethrow;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _dioClient.post(ApiConstants.logout);
      
      // Clear all stored data
      await _secureStorage.delete(key: 'auth_token');
      await _secureStorage.delete(key: 'user_id');
      await _secureStorage.delete(key: 'user_email');
      await _secureStorage.delete(key: 'pending_email');
    } catch (e) {
      // Even if API call fails, clear local data
      await _secureStorage.deleteAll();
      rethrow;
    }
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await _secureStorage.read(key: 'auth_token');
    return token != null && token.isNotEmpty;
  }

  // Get stored token
  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  // Get stored user email
  Future<String?> getUserEmail() async {
    return await _secureStorage.read(key: 'user_email');
  }

  // Get pending email (for verification)
  Future<String?> getPendingEmail() async {
    return await _secureStorage.read(key: 'pending_email');
  }
}
