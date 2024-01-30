class RegistrationResponseEntity {
  const RegistrationResponseEntity({
    required this.id,
    required this.type,
    required this.attributes,
  });

  final String id;
  final String type;
  final RegistrationResponseAttributes attributes;
}

class RegistrationResponseAttributes {
  const RegistrationResponseAttributes({
    required this.phone,
    required this.ref,
  });

  final String phone;
  final String ref;
}
