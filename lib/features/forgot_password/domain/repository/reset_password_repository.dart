import 'package:dartz/dartz.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/approve_reset_password_response.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/approve_reset_password.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/reset_password_entity.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/reset_password_response.dart';

abstract class ResetPasswordRepository {
  Future<Either<BaseError, ApproveResetPasswordResponseEntity>>
      approveResetPassword(
          ApproveResetPasswordEntity approveResetPasswordEntity);
  Future<Either<BaseError, ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordEntity resetPasswordEntity);
}
