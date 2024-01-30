import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_response.g.dart';

@JsonSerializable(explicitToJson: true)
class InvitationResponse {
  final String? email;
  final String? userName;
  final String? userSurName;
  final String? id;

  InvitationResponse({
    this.id,
    this.email,
    this.userSurName,
    this.userName,
  });

  factory InvitationResponse.fromJson(Map<String, dynamic> json) =>
      _$InvitationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvitationResponseToJson(this);
}
