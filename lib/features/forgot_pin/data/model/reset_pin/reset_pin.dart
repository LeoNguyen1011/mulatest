import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/entity/reset_pin_entity.dart';

part 'reset_pin.freezed.dart';
part 'reset_pin.g.dart';

@freezed
class ResetPin extends ResetPinEntity with _$ResetPin {
  const factory ResetPin({
    required final String pin,
    required final String password,
    required final String uid,
  }) = _ResetPin;

  factory ResetPin.fromJson(Map<String, dynamic> json) =>
      _$ResetPinFromJson(json);
}
