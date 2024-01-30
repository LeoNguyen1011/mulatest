class ResetPinResponseEntity {
  final String id;
  final String type;
  final ResetPinResponseAttributes attributes;

  ResetPinResponseEntity(
      {required this.id, required this.type, required this.attributes});
}

class ResetPinResponseAttributes {
  const ResetPinResponseAttributes({
    required this.accessToken,
    required this.refreshToken,
  });
  final String accessToken;
  final String refreshToken;
}
