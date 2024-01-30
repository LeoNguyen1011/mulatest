class ChangeDeviceResponseEntity {
  const ChangeDeviceResponseEntity({
    required this.id,
    required this.type,
    required this.attributes,
  });

  final String id;
  final String type;
  final ChangeDeviceResponseAttributes attributes;
}

class ChangeDeviceResponseAttributes {
  const ChangeDeviceResponseAttributes({
    required this.ref,
  });
  final String ref;
}
