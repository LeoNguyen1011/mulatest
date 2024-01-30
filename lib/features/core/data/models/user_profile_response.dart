import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfileResponse {
  final String? id;
  final String? type;
  final UserProfileAttributes? attributes;

  UserProfileResponse({
    this.id,
    this.type,
    this.attributes,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserProfileAttributes {
  final String? maskedPhone;
  @JsonKey(name: "full_name")
  final String? fullName;
  final String? faceImage;
  final String? uuid;
  final String? lang;
  final int? companyId;
  final String? role;
  final String? email;

  UserProfileAttributes({
    this.maskedPhone,
    this.fullName,
    this.faceImage,
    this.uuid,
    this.lang,
    this.companyId,
    this.role,
    this.email,
  });

  factory UserProfileAttributes.fromJson(Map<String, dynamic> json) =>
      _$UserProfileAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileAttributesToJson(this);
}
