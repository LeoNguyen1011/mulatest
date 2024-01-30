class ApproveChangeDeviceResponseEntity {
  final String id;
  final String type;
  final ApproveChangeDeviceResponseAttributes attributes;

  ApproveChangeDeviceResponseEntity(
      {required this.id, required this.type, required this.attributes});
}

class ApproveChangeDeviceResponseAttributes {
  const ApproveChangeDeviceResponseAttributes({
    required this.accessToken,
    required this.deviceId,
  });

  final String accessToken;
  final int deviceId;
}
