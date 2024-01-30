import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/change_device_response.dart';

part 'change_device_response.freezed.dart';

part 'change_device_response.g.dart';

@freezed
class ChangeDeviceResponseModelData extends ChangeDeviceResponseEntity
    with _$ChangeDeviceResponseModelData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChangeDeviceResponseModelData({
    required final String id,
    required final String type,
    required final ChangeDeviceResponseModelAttributes attributes,
  }) = _ChangeDeviceResponseModelData;

  factory ChangeDeviceResponseModelData.fromJson(Map<String, dynamic> json) =>
      _$ChangeDeviceResponseModelDataFromJson(json);
}

@freezed
class ChangeDeviceResponseModelAttributes extends ChangeDeviceResponseAttributes
    with _$ChangeDeviceResponseModelAttributes {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChangeDeviceResponseModelAttributes({
    // required final String phone,
    required final String ref,
  }) = _ChangeDeviceResponseModelAttributes;

  factory ChangeDeviceResponseModelAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ChangeDeviceResponseModelAttributesFromJson(json);
}
