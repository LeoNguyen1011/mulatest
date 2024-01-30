import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/approve_reset_password.dart';

part 'approve_reset_password.freezed.dart';
part 'approve_reset_password.g.dart';

@freezed
class ApproveResetPassword extends ApproveResetPasswordEntity
    with _$ApproveResetPassword {
  const factory ApproveResetPassword({
    required final String otp,
    required final String ref,
  }) = _ApproveResetPassword;

  factory ApproveResetPassword.fromJson(Map<String, dynamic> json) =>
      _$ApproveResetPasswordFromJson(json);
}
