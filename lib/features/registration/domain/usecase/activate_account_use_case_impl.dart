import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/otp_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/registration_entity.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/registration_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/repository/registration_repository.dart';
import 'package:mula_biz_mobile/features/registration/domain/usecase/activate_account_use_case.dart';

@Injectable(as: AccountActivationUseCase)
class AccountActivationUseCaseImpl implements AccountActivationUseCase {
  AccountActivationUseCaseImpl(this._coreRepo);

  final RegistrationRepository _coreRepo;

  @override
  Future<Either<BaseError, RegistrationResponseEntity>> activateAccount({
    required RegistrationEntity registration,
  }) {
    return _coreRepo.activateAccount(registration);
  }

  @override
  Future<Either<BaseError, OtpResponse>> approveAccount(
      {required String otp, required String ref, required String lang}) {
    return _coreRepo.approveAccount(otp: otp, lang: lang, ref: ref);
  }
}
