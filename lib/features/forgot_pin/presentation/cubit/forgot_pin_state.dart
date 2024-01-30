// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'forgot_pin_cubit.dart';

class ForgotPinState extends Equatable {
  final BaseStateStatus forgotPinStatus;
  final String? errorMsg;

  const ForgotPinState({
    this.errorMsg = '',
    this.forgotPinStatus = BaseStateStatus.init,
  });

  @override
  List get props => [forgotPinStatus, errorMsg];

  ForgotPinState copyWith({
    BaseStateStatus? forgotPinStatus,
    String? errorMsg,
  }) {
    return ForgotPinState(
      forgotPinStatus: forgotPinStatus ?? this.forgotPinStatus,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
