import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/approve_change_device_response.dart';
part 'approve_change_device_response.freezed.dart';

part 'approve_change_device_response.g.dart';

@freezed
class ApproveChangeDeviceResponseModelData
    extends ApproveChangeDeviceResponseEntity
    with _$ApproveChangeDeviceResponseModelData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ApproveChangeDeviceResponseModelData({
    required final String id,
    required final String type,
    required final ApproveChangeDeviceResponseModelAttributes attributes,
  }) = _ApproveChangeDeviceResponseModelData;

  factory ApproveChangeDeviceResponseModelData.fromJson(
          Map<String, dynamic> json) =>
      _$ApproveChangeDeviceResponseModelDataFromJson(json);
}

@freezed
class ApproveChangeDeviceResponseModelAttributes
    extends ApproveChangeDeviceResponseAttributes
    with _$ApproveChangeDeviceResponseModelAttributes {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ApproveChangeDeviceResponseModelAttributes({
    required final String accessToken,
    required final int deviceId,
  }) = _ApproveChangeDeviceResponseModelAttributes;

  factory ApproveChangeDeviceResponseModelAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$ApproveChangeDeviceResponseModelAttributesFromJson(json);
}
