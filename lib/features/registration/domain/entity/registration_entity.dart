// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class RegistrationEntity extends Equatable {
  final String? invitationCode;
  final String? firstName;
  final String? lastName;
  final String? password;
  final String? phone;
  final String? email;
  final String? uid;
  final String? name;
  final String? model;
  final String? os;
  final String? faceImage;
  final String? lang;
  final String? pin;

  const RegistrationEntity(
      {this.invitationCode,
      this.firstName,
      this.lastName,
      this.password,
      this.phone,
      this.email,
      this.uid,
      this.name,
      this.model,
      this.os,
      this.faceImage,
      this.lang,
      this.pin});

  RegistrationEntity copyWith({
    String? invitationCode,
    String? firstName,
    String? lastName,
    String? password,
    String? phone,
    String? email,
    String? uid,
    String? name,
    String? model,
    String? os,
    String? faceImage,
    String? lang,
    String? pin,
  }) {
    return RegistrationEntity(
      invitationCode: invitationCode ?? this.invitationCode,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      model: model ?? this.model,
      os: os ?? this.os,
      faceImage: faceImage ?? this.faceImage,
      lang: lang ?? this.lang,
      pin: pin ?? this.pin,
    );
  }

  @override
  List<Object?> get props => [
        invitationCode,
        firstName,
        lastName,
        password,
        phone,
        email,
        uid,
        name,
        model,
        os,
        faceImage,
        lang,
        pin
      ];
}
