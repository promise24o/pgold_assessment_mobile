import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
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
  @JsonKey(name: 'email_verified', defaultValue: false)
  final bool emailVerified;
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @JsonKey(name: 'face_id_enabled', defaultValue: false)
  final bool faceIdEnabled;
  @JsonKey(name: 'fingerprint_enabled', defaultValue: false)
  final bool fingerprintEnabled;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.fullName,
    this.phoneNumber,
    this.referralCode,
    this.heardFrom,
    this.emailVerified = false,
    this.emailVerifiedAt,
    this.faceIdEnabled = false,
    this.fingerprintEnabled = false,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
