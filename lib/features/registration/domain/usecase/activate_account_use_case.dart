import 'package:dartz/dartz.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/otp_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/registration_entity.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/registration_response.dart';

abstract class AccountActivationUseCase {
  Future<Either<BaseError, RegistrationResponseEntity>> activateAccount({
    required RegistrationEntity registration,
  });

  Future<Either<BaseError, OtpResponse>> approveAccount(
      {required String otp, required String ref, required String lang});
}
