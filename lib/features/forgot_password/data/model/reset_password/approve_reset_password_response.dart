import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/approve_reset_password_response.dart';
part 'approve_reset_password_response.freezed.dart';

part 'approve_reset_password_response.g.dart';

@freezed
class ApproveResetPasswordResponseModelData
    extends ApproveResetPasswordResponseEntity
    with _$ApproveResetPasswordResponseModelData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ApproveResetPasswordResponseModelData({
    required final String id,
    required final String type,
    required final ApproveResetPasswordResponseModelAttributes attributes,
  }) = _ApproveResetPasswordResponseModelData;

  factory ApproveResetPasswordResponseModelData.fromJson(
          Map<String, dynamic> json) =>
      _$ApproveResetPasswordResponseModelDataFromJson(json);
}

@freezed
class ApproveResetPasswordResponseModelAttributes
    extends ApproveResetPasswordResponseAttributes
    with _$ApproveResetPasswordResponseModelAttributes {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ApproveResetPasswordResponseModelAttributes({
    required final String accessToken,
    required final String refreshToken,
  }) = _ApproveResetPasswordResponseModelAttributes;

  factory ApproveResetPasswordResponseModelAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ApproveResetPasswordResponseModelAttributesFromJson(json);
}
