import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/otp_response.dart';

part 'otp_response.freezed.dart';

part 'otp_response.g.dart';

@freezed
class OtpResponseModelData extends OtpResponse with _$OtpResponseModelData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OtpResponseModelData({
    required final String id,
    required final String type,
    required final OtpResponseModelAttributes attributes,
  }) = _OtpResponseModelData;

  factory OtpResponseModelData.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseModelDataFromJson(json);
}

@freezed
class OtpResponseModelAttributes extends OtpResponseAttributes
    with _$OtpResponseModelAttributes {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OtpResponseModelAttributes({
    required final String accessToken,
    required final int deviceId,
  }) = _OtpResponseModelAttributes;

  factory OtpResponseModelAttributes.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseModelAttributesFromJson(json);
}
