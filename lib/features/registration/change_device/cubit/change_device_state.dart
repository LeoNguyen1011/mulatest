// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'change_device_cubit.dart';

class ChangeDeviceState extends Equatable {
  final BaseStateStatus changeMailStatus;
  final BaseStateStatus faceDetectStatus;
  final BaseStateStatus otpStatus;

  final String confirmOtpErrorMsg;
  final String changeMailStatusErrorMsg;
  final String checkFaceStatusErrorMsg;

  const ChangeDeviceState({
    this.changeMailStatus = BaseStateStatus.init,
    this.faceDetectStatus = BaseStateStatus.init,
    this.otpStatus = BaseStateStatus.init,
    this.confirmOtpErrorMsg = '',
    this.changeMailStatusErrorMsg = '',
    this.checkFaceStatusErrorMsg = '',
  });

  @override
  List get props => [
        changeMailStatus,
        faceDetectStatus,
        otpStatus,
        confirmOtpErrorMsg,
        changeMailStatusErrorMsg,
        checkFaceStatusErrorMsg,
      ];

  ChangeDeviceState copyWith({
    BaseStateStatus? changeMailStatus,
    BaseStateStatus? faceDetectStatus,
    BaseStateStatus? otpStatus,
    String? confirmOtpErrorMsg,
    String? changeMailStatusErrorMsg,
    String? checkFaceStatusErrorMsg,
  }) {
    return ChangeDeviceState(
      changeMailStatus: changeMailStatus ?? this.changeMailStatus,
      faceDetectStatus: faceDetectStatus ?? this.faceDetectStatus,
      otpStatus: otpStatus ?? this.otpStatus,
      confirmOtpErrorMsg: confirmOtpErrorMsg ?? this.confirmOtpErrorMsg,
      changeMailStatusErrorMsg:
          changeMailStatusErrorMsg ?? this.changeMailStatusErrorMsg,
      checkFaceStatusErrorMsg:
          checkFaceStatusErrorMsg ?? this.checkFaceStatusErrorMsg,
    );
  }
}
