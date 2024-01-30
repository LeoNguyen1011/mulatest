import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/entity/sign_in_response.dart';

part 'signin_response.freezed.dart';

part 'signin_response.g.dart';

@freezed
class SignInResponseModelData extends SignInResponseEntity
    with _$SignInResponseModelData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SignInResponseModelData({
    required final String id,
    required final String type,
    required final SignInResponseModelAttributes attributes,
  }) = _SignInResponseModelData;

  factory SignInResponseModelData.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelDataFromJson(json);
}

@freezed
class SignInResponseModelAttributes extends SignInResponseAttributes
    with _$SignInResponseModelAttributes {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SignInResponseModelAttributes({
    required final String accessToken,
    required final String refreshToken,
    required final int expiresIn,
    required final String tokenType,
    required final String lang,
    required final bool? passwordUpdated,
    required final int deviceId,
  }) = _SignInResponseModelAttributes;

  factory SignInResponseModelAttributes.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelAttributesFromJson(json);
}
