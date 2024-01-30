import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/common/utils/encryption_helper.dart';
import 'package:mula_biz_mobile/common/utils/functions/device_info.dart';
import 'package:mula_biz_mobile/di/di_setup.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/entity/reset_pin_entity.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/usecases/reset_pin_usecase.dart';

part 'forgot_pin_state.dart';

class ForgotPinCubit extends Cubit<ForgotPinState> {
  ForgotPinCubit() : super(const ForgotPinState());
  final ResetPinUseCase _resetPinUseCase = getIt<ResetPinUseCase>();

  static String pin = '';
  static String password = '';
  void onResetPin() async {
    emit(
        state.copyWith(forgotPinStatus: BaseStateStatus.loading, errorMsg: ''));
    final deviceId = await DeviceInfo.getDeviceId();
    final failureOrResponse = await _resetPinUseCase.resetPin(
        resetPinEntity: ResetPinEntity(
      pin: await encryptPIN(pin),
      uid: deviceId,
      password: password,
    ));
    failureOrResponse.fold(
        (l) => {
              if (l is MessageError)
                {
                  emit(
                    state.copyWith(
                        errorMsg: l.detail,
                        forgotPinStatus: BaseStateStatus.failed),
                  ),
                },
            },
        (r) => {
              emit(state.copyWith(
                  forgotPinStatus: BaseStateStatus.success, errorMsg: ""))
            });
    return;
  }
}
