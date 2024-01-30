class OtpResponse {
  const OtpResponse(
      {required this.id, required this.type, required this.attributes});

  final String id;
  final String type;
  final OtpResponseAttributes attributes;
}

class OtpResponseAttributes {
  const OtpResponseAttributes({
    required this.accessToken,
    required this.deviceId,
  });

  final String accessToken;
  final int deviceId;
}
