// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_device_model.g.dart';

@JsonSerializable()
class ChangeDeviceModel {
  @JsonKey(name: "activation_code")
  final String? activationCode;
  final String? phone;
  final String? uid;
  final String? name;
  final String? model;
  final String? os;
  @JsonKey(name: "face_image")
  final String? faceImage;
  final String? lang;
  final String? pin;
  const ChangeDeviceModel({
    this.activationCode,
    this.phone,
    this.uid,
    this.name,
    this.model,
    this.os,
    this.faceImage,
    this.lang,
    this.pin,
  });

  factory ChangeDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeDeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeDeviceModelToJson(this);

  ChangeDeviceModel copyWith({
    String? activationCode,
    String? phone,
    String? uid,
    String? name,
    String? model,
    String? os,
    String? faceImage,
    String? lang,
    String? pin,
  }) {
    return ChangeDeviceModel(
      activationCode: activationCode ?? this.activationCode,
      phone: phone ?? this.phone,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      model: model ?? this.model,
      os: os ?? this.os,
      faceImage: faceImage ?? this.faceImage,
      lang: lang ?? this.lang,
      pin: pin ?? this.pin,
    );
  }
}
