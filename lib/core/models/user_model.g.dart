// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      phoneNumber: json['phone_number'] as String?,
      referralCode: json['referral_code'] as String?,
      heardFrom: json['heard_from'] as String?,
      emailVerified: json['email_verified'] as bool? ?? false,
      emailVerifiedAt: json['email_verified_at'] as String?,
      faceIdEnabled: json['face_id_enabled'] as bool? ?? false,
      fingerprintEnabled: json['fingerprint_enabled'] as bool? ?? false,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'referral_code': instance.referralCode,
      'heard_from': instance.heardFrom,
      'email_verified': instance.emailVerified,
      'email_verified_at': instance.emailVerifiedAt,
      'face_id_enabled': instance.faceIdEnabled,
      'fingerprint_enabled': instance.fingerprintEnabled,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
