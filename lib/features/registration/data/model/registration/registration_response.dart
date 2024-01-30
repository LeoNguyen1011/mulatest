import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/registration_response.dart';
part 'registration_response.freezed.dart';

part 'registration_response.g.dart';

@freezed
class RegistrationResponseModelData extends RegistrationResponseEntity
    with _$RegistrationResponseModelData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RegistrationResponseModelData({
    required final String id,
    required final String type,
    required final RegistrationResponseModelAttributes attributes,
  }) = _RegistrationResponseModelData;

  factory RegistrationResponseModelData.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseModelDataFromJson(json);
}

@freezed
class RegistrationResponseModelAttributes extends RegistrationResponseAttributes
    with _$RegistrationResponseModelAttributes {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RegistrationResponseModelAttributes({
    required final String phone,
    required final String ref,
  }) = _RegistrationResponseModelAttributes;

  factory RegistrationResponseModelAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$RegistrationResponseModelAttributesFromJson(json);
}
