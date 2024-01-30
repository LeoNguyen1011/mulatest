import 'package:mula_biz_mobile/features/registration/data/model/change_device/approve_change_device_response.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/change_device_model.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/change_device_response.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/send_activation_response.dart';
import 'package:mula_biz_mobile/features/registration/data/model/registration/otp_response.dart';
import 'package:mula_biz_mobile/features/registration/data/model/registration/registration.dart';
import 'package:mula_biz_mobile/features/registration/data/model/registration/registration_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/approve_change_device_entity.dart';

import '../../../../../base/network/models/base_data.dart';

abstract class RegistrationDataSource {
  Future<BaseData<RegistrationResponseModelData>> activateAccount({
    required Registration registration,
  });

  Future<BaseData<OtpResponseModelData>> approveAccount({
    required String otp,
    required String ref,
    required String mode,
  });

  Future<BaseData<SendActivationResponseModelData>> sendActivationCode({
    required String email,
  });
  Future<BaseData<ChangeDeviceResponseModelData>> changeDevice({
    required ChangeDeviceModel changeDeviceEntity,
  });

  Future<BaseData<ApproveChangeDeviceResponseModelData>> approveChangeDevice({
    required ApproveChangeDeviceEntity approveChangeDeviceEntity,
  });
}
