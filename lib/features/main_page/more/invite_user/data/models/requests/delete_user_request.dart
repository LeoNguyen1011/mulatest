import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_request.g.dart';

@JsonSerializable(explicitToJson: true)
class DeleteUserRequest {
  final String? pin;
  @JsonKey(name: "user_id")
  final String? userID;

  DeleteUserRequest({
    this.pin,
    this.userID,
  });

  factory DeleteUserRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserRequestToJson(this);
}
