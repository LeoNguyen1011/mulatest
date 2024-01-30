import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RefreshTokenResponse {
  const RefreshTokenResponse({
    required this.accessToken,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  final String? accessToken;

  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}
