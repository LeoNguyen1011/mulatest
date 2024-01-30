class ResetPasswordResponseEntity {
  const ResetPasswordResponseEntity({
    required this.id,
    required this.type,
    required this.attributes,
  });

  final String id;
  final String type;
  final ResetPasswordResponseAttributes attributes;
}

class ResetPasswordResponseAttributes {
  const ResetPasswordResponseAttributes({
    required this.ref,
  });
  final String ref;
}
