import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/base/bloc/index.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/common/enums/auth_type_enum.dart';
import 'package:mula_biz_mobile/common/utils/encryption_helper.dart';
import 'package:mula_biz_mobile/common/utils/functions/device_info.dart';
import 'package:mula_biz_mobile/di/di_setup.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/entity/signin_entity.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/usecase/sign_in_use_case.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());

  final SignInUseCase _signInUseCase = getIt<SignInUseCase>();

  static String passwordForSignInButton = "";

  void signIn({String? pin, String? password}) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    final deviceName = await DeviceInfo.getDeviceName();
    final deviceId = await DeviceInfo.getDeviceId();
    final deviceOs = DeviceInfo.getDeviceOSName();
    final deviceModel = await DeviceInfo.getDeviceModel();
    if (pin != null) {
      final failureOrResponse = await _signInUseCase.signInWithPin(
        authType: AuthType.pin,
        encryptedPin: await encryptPIN(pin),
        uid: deviceId,
      );
      password = '';

      failureOrResponse.fold(
        (error) {
          if (error is MessageError) {
            emit(
              state.copyWith(
                status: BaseStateStatus.failed,
                errorMessage: error.detail,
              ),
            );
          }
        },
        (r) {
          emit(
            state.copyWith(status: BaseStateStatus.success),
          );
        },
      );
    } else if (password != null) {
      final signIn = SignInWithPasswordEntity(
          password: password,
          uid: deviceId,
          name: deviceName,
          os: deviceOs,
          model: deviceModel);
      final failureOrResponse =
          await _signInUseCase.signInWithPassword(signInWithPassword: signIn);
      password = '';

      failureOrResponse.fold(
        (error) {
          if (error is MessageError) {
            emit(state.copyWith(
              status: BaseStateStatus.failed,
              errorMessage: error.detail,
            ));
          }
        },
        (r) => {
          {
            emit(
              state.copyWith(status: BaseStateStatus.success),
            ),
          }
        },
      );
    }
  }
}
