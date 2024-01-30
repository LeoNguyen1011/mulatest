import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_invites_request.g.dart';

@JsonSerializable(explicitToJson: true)
class SendInvitesRequest {
  final String? pin;
  final String? userName;
  final String? userSurName;
  final List<String>? emails;

  SendInvitesRequest({
    this.emails,
    this.userSurName,
    this.userName,
    this.pin,
  });

  factory SendInvitesRequest.fromJson(Map<String, dynamic> json) =>
      _$SendInvitesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendInvitesRequestToJson(this);
}
