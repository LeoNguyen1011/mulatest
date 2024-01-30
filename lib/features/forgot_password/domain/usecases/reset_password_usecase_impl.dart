import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/approve_reset_password_response.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/approve_reset_password.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/reset_password_entity.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/reset_password_response.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/repository/reset_password_repository.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/usecases/reset_password_usecase.dart';

@Injectable(as: ResetPasswordUseCase)
class ResetPasswordUseCaseImpl implements ResetPasswordUseCase {
  ResetPasswordUseCaseImpl(this._coreRepo);

  final ResetPasswordRepository _coreRepo;
  @override
  Future<Either<BaseError, ResetPasswordResponseEntity>> resetPassword(
      {required ResetPasswordEntity resetPasswordEntity}) {
    return _coreRepo.resetPassword(resetPasswordEntity);
  }

  @override
  Future<Either<BaseError, ApproveResetPasswordResponseEntity>>
      approveResetPassword(
          {required ApproveResetPasswordEntity approveResetPasswordEntity}) {
    return _coreRepo.approveResetPassword(approveResetPasswordEntity);
  }
}
