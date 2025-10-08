import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'auth_models.g.dart';

// Login Request
@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

// Login Response
@JsonSerializable()
class LoginResponse {
  final String message;
  final UserModel user;
  final String token;

  LoginResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

// Register Request
@JsonSerializable()
class RegisterRequest {
  final String username;
  final String email;
  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'referral_code')
  final String? referralCode;
  @JsonKey(name: 'heard_from')
  final String? heardFrom;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  RegisterRequest({
    required this.username,
    required this.email,
    required this.fullName,
    this.phoneNumber,
    this.referralCode,
    this.heardFrom,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

// Register Response
@JsonSerializable()
class RegisterResponse {
  final String message;
  final UserModel user;
  @JsonKey(name: 'verification_code')
  final String? verificationCode;
  final String? token;

  RegisterResponse({
    required this.message,
    required this.user,
    this.verificationCode,
    this.token,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

// Email Verification Request
@JsonSerializable()
class EmailVerificationRequest {
  final String email;

  EmailVerificationRequest({required this.email});

  Map<String, dynamic> toJson() => _$EmailVerificationRequestToJson(this);
}

// Email Confirmation Request
@JsonSerializable()
class EmailConfirmationRequest {
  final String email;
  final String code;

  EmailConfirmationRequest({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() => _$EmailConfirmationRequestToJson(this);
}

// Generic API Response
@JsonSerializable()
class ApiResponse {
  final String message;

  ApiResponse({required this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}

// Biometric Setup Request
@JsonSerializable()
class BiometricSetupRequest {
  @JsonKey(name: 'face_id_enabled')
  final bool? faceIdEnabled;
  @JsonKey(name: 'fingerprint_enabled')
  final bool? fingerprintEnabled;

  BiometricSetupRequest({
    this.faceIdEnabled,
    this.fingerprintEnabled,
  });

  Map<String, dynamic> toJson() => _$BiometricSetupRequestToJson(this);
}

// Profile Response
@JsonSerializable()
class ProfileResponse {
  final String? message;
  final UserModel user;

  ProfileResponse({
    this.message,
    required this.user,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
