import 'package:dartz/dartz.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/change_device_model.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/approve_change_device_entity.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/approve_change_device_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/change_device_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/otp_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/registration_entity.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/registration_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/send_activation_response.dart';

abstract class RegistrationRepository {
  Future<Either<BaseError, RegistrationResponseEntity>> activateAccount(
      RegistrationEntity registrationEntity);

  Future<Either<BaseError, OtpResponse>> approveAccount(
      {required String otp, required String lang, required String ref});

  Future<Either<BaseError, SendActivationResponseEntity>> sendActivationCode(
      {required String email});

  Future<Either<BaseError, ApproveChangeDeviceResponseEntity>>
      approveChangeDevice(ApproveChangeDeviceEntity approveChangeDeviceEntity);
  Future<Either<BaseError, ChangeDeviceResponseEntity>> changeDevice(
      ChangeDeviceModel changeDeviceEntity);
}
