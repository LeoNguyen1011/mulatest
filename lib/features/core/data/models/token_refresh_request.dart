import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_refresh_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TokenRefreshRequestBody {
  const TokenRefreshRequestBody({
    required this.refreshToken,
  });

  factory TokenRefreshRequestBody.fromJson(Map<String, dynamic> json) =>
      _$TokenRefreshRequestBodyFromJson(json);

  final String refreshToken;

  Map<String, dynamic> toJson() => _$TokenRefreshRequestBodyToJson(this);
}
