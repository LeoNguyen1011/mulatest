import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/reset_password_response.dart';

part 'reset_password_response.freezed.dart';

part 'reset_password_response.g.dart';

@freezed
class ResetPasswordResponseModelData extends ResetPasswordResponseEntity
    with _$ResetPasswordResponseModelData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ResetPasswordResponseModelData({
    required final String id,
    required final String type,
    required final ResetPasswordResponseModelAttributes attributes,
  }) = _ResetPasswordResponseModelData;

  factory ResetPasswordResponseModelData.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseModelDataFromJson(json);
}

@freezed
class ResetPasswordResponseModelAttributes
    extends ResetPasswordResponseAttributes
    with _$ResetPasswordResponseModelAttributes {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ResetPasswordResponseModelAttributes({
    required final String phone,
    required final String ref,
  }) = _ResetPasswordResponseModelAttributes;

  factory ResetPasswordResponseModelAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ResetPasswordResponseModelAttributesFromJson(json);
}
