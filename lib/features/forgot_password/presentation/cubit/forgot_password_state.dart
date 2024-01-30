// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  final BaseStateStatus otpConfirmStatus;
  final String otpConfirmErrorMsg;
  final BaseStateStatus passwordResetStatus;
  final String passwordResetErrorMsg;

  const ForgotPasswordState({
    this.otpConfirmErrorMsg = '',
    this.otpConfirmStatus = BaseStateStatus.init,
    this.passwordResetErrorMsg = '',
    this.passwordResetStatus = BaseStateStatus.init,
  });

  @override
  List<Object?> get props => [
        otpConfirmErrorMsg,
        otpConfirmStatus,
        passwordResetErrorMsg,
        passwordResetStatus,
      ];

  ForgotPasswordState copyWith({
    BaseStateStatus? otpConfirmStatus,
    String? otpConfirmErrorMsg,
    BaseStateStatus? passwordResetStatus,
    String? passwordResetErrorMsg,
  }) {
    return ForgotPasswordState(
      otpConfirmStatus: otpConfirmStatus ?? this.otpConfirmStatus,
      otpConfirmErrorMsg: otpConfirmErrorMsg ?? this.otpConfirmErrorMsg,
      passwordResetStatus: passwordResetStatus ?? this.passwordResetStatus,
      passwordResetErrorMsg:
          passwordResetErrorMsg ?? this.passwordResetErrorMsg,
    );
  }
}
