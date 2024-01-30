class SignInResponseEntity {
  const SignInResponseEntity({
    required this.id,
    required this.type,
    required this.attributes,
  });

  final String id;
  final String type;
  final SignInResponseAttributes attributes;
}

class SignInResponseAttributes {
  const SignInResponseAttributes({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.tokenType,
    required this.lang,
    required this.passwordUpdated,
    required this.deviceId,
  });
  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final String tokenType;
  final String lang;
  final bool? passwordUpdated;
  final int deviceId;
}
