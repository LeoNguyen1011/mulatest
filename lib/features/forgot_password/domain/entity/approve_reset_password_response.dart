class ApproveResetPasswordResponseEntity {
  final String id;
  final String type;
  final ApproveResetPasswordResponseAttributes attributes;

  ApproveResetPasswordResponseEntity(
      {required this.id, required this.type, required this.attributes});
}

class ApproveResetPasswordResponseAttributes {
  const ApproveResetPasswordResponseAttributes({
    required this.accessToken,
    required this.refreshToken,
  });
  final String accessToken;
  final String refreshToken;
}
