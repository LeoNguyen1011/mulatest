import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/di/di_setup.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/registration_entity.dart';
import 'package:mula_biz_mobile/features/registration/domain/usecase/activate_account_use_case.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

part 'account_activation_state.dart';

class AccountActivationCubit extends Cubit<AccountActivationState> {
  AccountActivationCubit() : super(const AccountActivationState());

  final AccountActivationUseCase _accountActivationUseCase = getIt<AccountActivationUseCase>();

  static RegistrationEntity registrationEntity = const RegistrationEntity();
  static String ref = '';
  static String phoneNumberToShowOnOtpPage = '';

  void onOTPChanged({required String otp}) async {
    emit(state.copyWith(otpStatus: BaseStateStatus.loading));
    const lang = 'en';
    final failureOrResponse = await _accountActivationUseCase.approveAccount(otp: otp, ref: ref, lang: lang);

    failureOrResponse.fold((error) {
      emit(
        state.copyWith(
          otpStatus: BaseStateStatus.failed,
          otpConfirmErrorMsg: LocaleKeys.incorrectOTP.tr(),
        ),
      );
    }, (r) => {emit(state.copyWith(otpStatus: BaseStateStatus.success)) });
    return;
  }

  void activateAccount() async {
    emit(
      state.copyWith(
        registerFaceStatus: BaseStateStatus.loading,
      ),
    );

    final failureOrResponse = await _accountActivationUseCase.activateAccount(
      registration: registrationEntity,
    );
    failureOrResponse.fold((l) {
      if (l is MessageError) {
        emit(state.copyWith(faceRegisErrorMsg: l.detail, registerFaceStatus: BaseStateStatus.failed));
      }
    },
        (r) => {
              ref = r.attributes.ref,
              emit(state.copyWith(registerFaceStatus: BaseStateStatus.success)),
            });
    return;
  }

  void onResendOtp() async {
    state.copyWith(otpStatus: BaseStateStatus.loading);
    final failureOrResponse = await _accountActivationUseCase.activateAccount(
      registration: registrationEntity,
    );
    failureOrResponse.fold((errorData) => state.copyWith(otpStatus: BaseStateStatus.failed), (successData) {
      ref = successData.attributes.ref;
      emit(
        state.copyWith(otpStatus: BaseStateStatus.success),
      );
    });
    return;
  }

  void updateRegistrationEntity({
    String? invitationCode,
    String? firstName,
    String? lastName,
    String? password,
    String? phone,
    String? email,
    String? uid,
    String? name,
    String? model,
    String? os,
    String? faceImage,
    String? lang,
    String? pin,
  }) {
    registrationEntity = registrationEntity.copyWith(
      invitationCode: invitationCode ?? registrationEntity.invitationCode,
      firstName: firstName ?? registrationEntity.firstName,
      lastName: lastName ?? registrationEntity.lastName,
      password: password ?? registrationEntity.password,
      phone: phone ?? registrationEntity.phone,
      email: email ?? registrationEntity.email,
      uid: uid ?? registrationEntity.uid,
      name: name ?? registrationEntity.name,
      model: model ?? registrationEntity.model,
      os: os ?? registrationEntity.os,
      faceImage: faceImage ?? registrationEntity.faceImage,
      lang: lang ?? registrationEntity.lang,
      pin: pin ?? registrationEntity.pin,
    );
  }
}
