// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'account_activation_cubit.dart';

class AccountActivationState extends Equatable {
  final BaseStateStatus otpStatus;
  final BaseStateStatus registerFaceStatus;
  final String faceRegisErrorMsg;
  final String otpConfirmErrorMsg;

  const AccountActivationState({
    this.otpStatus = BaseStateStatus.init,
    this.registerFaceStatus = BaseStateStatus.init,
    this.faceRegisErrorMsg = '',
    this.otpConfirmErrorMsg = '',
  });
  @override
  List<Object?> get props => [
        otpStatus,
        registerFaceStatus,
        faceRegisErrorMsg,
        otpConfirmErrorMsg,
      ];

  AccountActivationState copyWith({
    BaseStateStatus? otpStatus,
    BaseStateStatus? registerFaceStatus,
    String? faceRegisErrorMsg,
    String? otpConfirmErrorMsg,
  }) {
    return AccountActivationState(
      otpStatus: otpStatus ?? this.otpStatus,
      registerFaceStatus: registerFaceStatus ?? this.registerFaceStatus,
      faceRegisErrorMsg: faceRegisErrorMsg ?? this.faceRegisErrorMsg,
      otpConfirmErrorMsg: otpConfirmErrorMsg ?? this.otpConfirmErrorMsg,
    );
  }
}
