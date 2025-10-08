// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
    };

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      username: json['username'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      phoneNumber: json['phone_number'] as String?,
      referralCode: json['referral_code'] as String?,
      heardFrom: json['heard_from'] as String?,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'referral_code': instance.referralCode,
      'heard_from': instance.heardFrom,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      message: json['message'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      verificationCode: json['verification_code'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'verification_code': instance.verificationCode,
      'token': instance.token,
    };

EmailVerificationRequest _$EmailVerificationRequestFromJson(
        Map<String, dynamic> json) =>
    EmailVerificationRequest(
      email: json['email'] as String,
    );

Map<String, dynamic> _$EmailVerificationRequestToJson(
        EmailVerificationRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

EmailConfirmationRequest _$EmailConfirmationRequestFromJson(
        Map<String, dynamic> json) =>
    EmailConfirmationRequest(
      email: json['email'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$EmailConfirmationRequestToJson(
        EmailConfirmationRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      message: json['message'] as String,
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

BiometricSetupRequest _$BiometricSetupRequestFromJson(
        Map<String, dynamic> json) =>
    BiometricSetupRequest(
      faceIdEnabled: json['face_id_enabled'] as bool?,
      fingerprintEnabled: json['fingerprint_enabled'] as bool?,
    );

Map<String, dynamic> _$BiometricSetupRequestToJson(
        BiometricSetupRequest instance) =>
    <String, dynamic>{
      'face_id_enabled': instance.faceIdEnabled,
      'fingerprint_enabled': instance.fingerprintEnabled,
    };

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      message: json['message'] as String?,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
