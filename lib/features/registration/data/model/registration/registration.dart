import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration.g.dart';

@JsonSerializable()
class Registration {
  @JsonKey(name: "invitation_code")
  final String? invitationCode;
  @JsonKey(name: "first_name")
  final String? firstName;
  @JsonKey(name: "last_name")
  final String? lastName;
  @JsonKey(name: "face_image")
  final String? faceImage;
  final String? password;
  final String? phone;
  final String? email;
  final String? uid;
  final String? name;
  final String? model;
  final String? os;
  final String? lang;
  final String? pin;

  const Registration({
    this.invitationCode,
    this.firstName,
    this.lastName,
    this.faceImage,
    this.password,
    this.phone,
    this.email,
    this.uid,
    this.name,
    this.model,
    this.os,
    this.lang,
    this.pin,
  });

  factory Registration.fromJson(Map<String, dynamic> json) =>
      _$RegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationToJson(this);
}
