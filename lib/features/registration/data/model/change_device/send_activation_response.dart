import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/send_activation_response.dart';
part 'send_activation_response.freezed.dart';

part 'send_activation_response.g.dart';

@freezed
class SendActivationResponseModelData extends SendActivationResponseEntity
    with _$SendActivationResponseModelData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SendActivationResponseModelData({
    required final String message,
    // required final ApproveResetPasswordResponseModelAttributes attributes,
  }) = _SendActivationResponseModelData;

  factory SendActivationResponseModelData.fromJson(Map<String, dynamic> json) =>
      _$SendActivationResponseModelDataFromJson(json);
}
