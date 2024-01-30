import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/approve_change_device_entity.dart';

part 'approve_change_device.freezed.dart';
part 'approve_change_device.g.dart';

@freezed
class ApproveChangeDevice extends ApproveChangeDeviceEntity
    with _$ApproveChangeDevice {
  const factory ApproveChangeDevice({
    required final String otp,
    required final String ref,
  }) = _ApproveChangeDevice;

  factory ApproveChangeDevice.fromJson(Map<String, dynamic> json) =>
      _$ApproveChangeDeviceFromJson(json);
}
