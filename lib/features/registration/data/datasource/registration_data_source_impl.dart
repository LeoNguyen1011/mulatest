import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/base/network/models/base_data.dart';
import 'package:mula_biz_mobile/common/multi_languages/localize_helper.dart';
import 'package:mula_biz_mobile/features/registration/data/datasource/registration_data_source.dart';
import 'package:mula_biz_mobile/features/registration/data/datasource/remote/service/registration_service.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/approve_change_device_response.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/change_device_model.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/change_device_response.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/send_activation_response.dart';
import 'package:mula_biz_mobile/features/registration/data/model/registration/otp_response.dart';
import 'package:mula_biz_mobile/features/registration/data/model/registration/registration.dart';
import 'package:mula_biz_mobile/features/registration/data/model/registration/registration_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/approve_change_device_entity.dart';

@Injectable(as: RegistrationDataSource)
class RegistrationDataSourceImpl implements RegistrationDataSource {
  final RegistrationService _registrationService;

  RegistrationDataSourceImpl(this._registrationService);

  @override
  Future<BaseData<RegistrationResponseModelData>> activateAccount({
    required Registration registration,
  }) async {
    return _registrationService.activateAccount(
      body: {
        'data': {
          "type": "user",
          "attributes": registration.toJson(),
        },
      },
      lang: await LocalizeHelper.getCurrentLanguage,
    );
  }

  @override
  Future<BaseData<OtpResponseModelData>> approveAccount(
      {required String otp, required String ref, required String mode}) async {
    return _registrationService.approveAccount(
      body: {
        "otp": otp.toString(),
        "ref": ref.toString(),
        "mode": "verify_registration",
      },
      lang: await LocalizeHelper.getCurrentLanguage,
    );
  }

  @override
  Future<BaseData<ChangeDeviceResponseModelData>> changeDevice(
      {required ChangeDeviceModel changeDeviceEntity}) async {
    return _registrationService.changeDevice(
      body: {
        "activation_code": changeDeviceEntity.activationCode,
        "phone": changeDeviceEntity.phone,
        "uid": changeDeviceEntity.uid,
        "name": changeDeviceEntity.name,
        "os": changeDeviceEntity.os,
        "model": changeDeviceEntity.model,
        "pin": changeDeviceEntity.pin,
        "face_image": changeDeviceEntity.faceImage
      },
      lang: await LocalizeHelper.getCurrentLanguage,
    );
  }

  @override
  Future<BaseData<SendActivationResponseModelData>> sendActivationCode(
      {required String email}) async {
    return _registrationService.sendActivationCode(
      body: {"email": email.toString()},
      lang: await LocalizeHelper.getCurrentLanguage,
    );
  }

  @override
  Future<BaseData<ApproveChangeDeviceResponseModelData>> approveChangeDevice({
    required ApproveChangeDeviceEntity approveChangeDeviceEntity,
  }) async {
    return _registrationService.approveChangeDevice(
      body: {
        "mode": "change_device",
        "ref": approveChangeDeviceEntity.ref,
        "otp": approveChangeDeviceEntity.otp
      },
      lang: await LocalizeHelper.getCurrentLanguage,
    );
  }
}
