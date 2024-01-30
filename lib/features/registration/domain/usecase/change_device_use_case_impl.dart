import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/change_device_model.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/approve_change_device_entity.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/approve_change_device_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/change_device_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/send_activation_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/repository/registration_repository.dart';
import 'package:mula_biz_mobile/features/registration/domain/usecase/change_device_use_case.dart';

@Injectable(as: ChangeDeviceUseCase)
class ChangeDevicetUseCaseImpl implements ChangeDeviceUseCase {
  ChangeDevicetUseCaseImpl(this._coreRepo);

  final RegistrationRepository _coreRepo;

  @override
  Future<Either<BaseError, ApproveChangeDeviceResponseEntity>>
      approveChangeDevice(
          {required ApproveChangeDeviceEntity approveChangeDeviceEntity}) {
    return _coreRepo.approveChangeDevice(approveChangeDeviceEntity);
  }

  @override
  Future<Either<BaseError, ChangeDeviceResponseEntity>> changeDevice(
      {required ChangeDeviceModel changeDeviceEntity}) {
    return _coreRepo.changeDevice(changeDeviceEntity);
  }

  @override
  Future<Either<BaseError, SendActivationResponseEntity>> sendActivationCode(
      {required String email}) {
    return _coreRepo.sendActivationCode(email: email);
  }
}
