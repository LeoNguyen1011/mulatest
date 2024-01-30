import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/common/utils/functions/convert_phone_number.dart';
import 'package:mula_biz_mobile/common/utils/functions/device_info.dart';
import 'package:mula_biz_mobile/di/di_setup.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/approve_reset_password.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/reset_password_entity.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/usecases/reset_password_usecase.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(const ForgotPasswordState());

  final ResetPasswordUseCase _resetPasswordUseCase =
      getIt<ResetPasswordUseCase>();

  static String emailTemp = '';
  static String passwordTemp = '';
  static String phoneNumberTemp = '';
  static String ref = '';

  void onOtpChanged({required String otp}) async {
    emit(state.copyWith(
      otpConfirmStatus: BaseStateStatus.loading,
    ));

    final failureOrResponse = await _resetPasswordUseCase.approveResetPassword(
        approveResetPasswordEntity:
            ApproveResetPasswordEntity(otp: otp, ref: ref));
    failureOrResponse.fold((error) {
      if (error is MessageError) {
        emit(state.copyWith(
            otpConfirmErrorMsg: error.detail,
            otpConfirmStatus: BaseStateStatus.failed));
      }
    },
        (r) =>
            {emit(state.copyWith(otpConfirmStatus: BaseStateStatus.success))});
    return;
  }

  void onResetPassword({
    String? email,
    String? password,
    String? phoneNumber,
  }) async {
    emit(state.copyWith(passwordResetStatus: BaseStateStatus.loading));
    phoneNumberTemp = phoneNumber ?? '';

    final deviceId = await DeviceInfo.getDeviceId();
    final failureOrResponse = await _resetPasswordUseCase.resetPassword(
        resetPasswordEntity: ResetPasswordEntity(
      email: email ?? emailTemp,
      phone:
          PhoneNumberHelper.convertPhoneNumber(phoneNumber ?? phoneNumberTemp),
      password: password ?? passwordTemp,
      uid: deviceId,
    ));
    failureOrResponse.fold((error) {
      if (error is MessageError) {
        emit(state.copyWith(
            passwordResetErrorMsg: error.detail,
            passwordResetStatus: BaseStateStatus.failed));
      }
    },
        (r) => {
              ref = r.attributes.ref,
              emit(
                state.copyWith(
                  passwordResetStatus: BaseStateStatus.success,
                ),
              ),
            });
    return;
  }
}
