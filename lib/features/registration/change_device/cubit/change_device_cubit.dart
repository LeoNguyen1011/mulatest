import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/common/utils/encryption_helper.dart';
import 'package:mula_biz_mobile/common/utils/functions/convert_phone_number.dart';
import 'package:mula_biz_mobile/common/utils/functions/device_info.dart';
import 'package:mula_biz_mobile/di/di_setup.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/change_device_model.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/approve_change_device_entity.dart';
import 'package:mula_biz_mobile/features/registration/domain/usecase/change_device_use_case.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

part 'change_device_state.dart';

class ChangeDeviceCubit extends Cubit<ChangeDeviceState> {
  ChangeDeviceCubit() : super(const ChangeDeviceState());
  final ChangeDeviceUseCase _changeDeviceUseCase = getIt<ChangeDeviceUseCase>();

  static ChangeDeviceModel changeDeviceModel = const ChangeDeviceModel();

  static String phoneNumberToShowOnOtpPage = '';
  static String ref = '';

  void onSendActivationCode({required String mail}) async {
    emit(state.copyWith(changeMailStatus: BaseStateStatus.loading));

    final failureOrResponse = await _changeDeviceUseCase.sendActivationCode(
      email: mail,
    );
    failureOrResponse.fold((error) {
      if (error is MessageError) {
        emit(state.copyWith(
            changeMailStatusErrorMsg: error.detail,
            changeMailStatus: BaseStateStatus.failed));
      } else {
        emit(
          state.copyWith(
            changeMailStatusErrorMsg: LocaleKeys.connectError.tr(),
            changeMailStatus: BaseStateStatus.failed,
          ),
        );
      }
    }, (r) {
      emit(state.copyWith(changeMailStatus: BaseStateStatus.success));
    });

    return;
  }

  void onChangeDevice({required XFile faceImage}) async {
    emit(
      state.copyWith(faceDetectStatus: BaseStateStatus.loading),
    );

    phoneNumberToShowOnOtpPage = changeDeviceModel.phone ?? '';
    final deviceName = await DeviceInfo.getDeviceName();
    final deviceId = await DeviceInfo.getDeviceId();
    final deviceOs = DeviceInfo.getDeviceOSName();
    final deviceModel = await DeviceInfo.getDeviceModel();
    const lang = 'en';
    var imageFile = File(faceImage.path);
    var byte = imageFile.readAsBytesSync();
    String imageConvertBase64 = base64.encode(byte);

    await updateChangeDevice(
      phone:
          PhoneNumberHelper.convertPhoneNumber(changeDeviceModel.phone ?? ''),
      uid: deviceId,
      name: deviceName,
      model: deviceModel,
      os: deviceOs,
      faceImage: imageConvertBase64,
      lang: lang,
      pin: await encryptPIN(changeDeviceModel.pin ?? ''),
      activationCode: changeDeviceModel.activationCode,
    );

    final failureOrResponse = await _changeDeviceUseCase.changeDevice(
        changeDeviceEntity: changeDeviceModel);
    failureOrResponse.fold(
      (error) {
        if (error is MessageError) {
          emit(state.copyWith(
              checkFaceStatusErrorMsg: error.detail,
              faceDetectStatus: BaseStateStatus.failed));
        } else {
          emit(state.copyWith(
              checkFaceStatusErrorMsg: LocaleKeys.connectError.tr(),
              faceDetectStatus: BaseStateStatus.failed));
        }
      },
      (r) => {
        ref = r.attributes.ref,
        emit(
          state.copyWith(
            faceDetectStatus: BaseStateStatus.success,
          ),
        ),
      },
    );

    return;
  }

  void onOTPChanged({required String otp}) async {
    emit(state.copyWith(
      otpStatus: BaseStateStatus.loading,
    ));
    final otpConfirm = ApproveChangeDeviceEntity(otp: otp, ref: ref);
    final failureOrResponse = await _changeDeviceUseCase.approveChangeDevice(
        approveChangeDeviceEntity: otpConfirm);
    failureOrResponse.fold((error) {
      emit(
        state.copyWith(
          otpStatus: BaseStateStatus.failed,
          confirmOtpErrorMsg: "Incorrect OTP",
        ),
      );
    },
        (r) => {
              emit(state.copyWith(
                otpStatus: BaseStateStatus.success,
              )),
            });
    return;
  }

  void onResendOtp() async {
    emit(state.copyWith(otpStatus: BaseStateStatus.loading));

    final failureOrResponse = await _changeDeviceUseCase.changeDevice(
        changeDeviceEntity: changeDeviceModel);

    failureOrResponse.fold((error) {
      if (error is MessageError) {
        emit(state.copyWith(
            confirmOtpErrorMsg: error.detail,
            otpStatus: BaseStateStatus.failed));
      } else {
        emit(state.copyWith(
            confirmOtpErrorMsg: LocaleKeys.connectError.tr(),
            otpStatus: BaseStateStatus.failed));
      }
    },
        (r) => {
              ref = r.attributes.ref,
              emit(state.copyWith(otpStatus: BaseStateStatus.success)),
            });
    return;
  }

  Future<void> updateChangeDevice({
    String? activationCode,
    String? phone,
    String? uid,
    String? name,
    String? model,
    String? os,
    String? faceImage,
    String? lang,
    String? pin,
  }) async {
    changeDeviceModel = changeDeviceModel.copyWith(
      activationCode: activationCode ?? changeDeviceModel.activationCode,
      phone: phone ?? changeDeviceModel.phone,
      uid: uid ?? changeDeviceModel.uid,
      name: name ?? changeDeviceModel.name,
      model: model ?? changeDeviceModel.model,
      os: os ?? changeDeviceModel.os,
      faceImage: faceImage ?? changeDeviceModel.faceImage,
      lang: lang ?? changeDeviceModel.lang,
      pin: pin ?? changeDeviceModel.pin ?? '',
    );
  }
}
