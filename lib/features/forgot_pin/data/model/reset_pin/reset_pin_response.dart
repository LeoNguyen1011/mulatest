import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/entity/reset_pin_response.dart';

part 'reset_pin_response.freezed.dart';

part 'reset_pin_response.g.dart';

@freezed
class ResetPinResponseModelData extends ResetPinResponseEntity
    with _$ResetPinResponseModelData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ResetPinResponseModelData({
    required final String id,
    required final String type,
    required final ResetPinResponseModelAttributes attributes,
  }) = _ResetPinResponseModelData;

  factory ResetPinResponseModelData.fromJson(Map<String, dynamic> json) =>
      _$ResetPinResponseModelDataFromJson(json);
}

@freezed
class ResetPinResponseModelAttributes extends ResetPinResponseAttributes
    with _$ResetPinResponseModelAttributes {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ResetPinResponseModelAttributes({
    required final String accessToken,
    required final String refreshToken,
  }) = _ResetPinResponseModelAttributes;

  factory ResetPinResponseModelAttributes.fromJson(Map<String, dynamic> json) =>
      _$ResetPinResponseModelAttributesFromJson(json);
}
