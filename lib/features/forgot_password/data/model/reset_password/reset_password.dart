import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/reset_password_entity.dart';

part 'reset_password.freezed.dart';
part 'reset_password.g.dart';

@freezed
class ResetPassword extends ResetPasswordEntity with _$ResetPassword {
  const factory ResetPassword({
    required final String email,
    required final String phone,
    required final String password,
    required final String uid,
  }) = _ResetPassword;

  factory ResetPassword.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordFromJson(json);
}
