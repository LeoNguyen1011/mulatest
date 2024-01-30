import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/base/network/errors/extension.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/local_data/sp_keys.dart';
import 'package:mula_biz_mobile/features/forgot_password/data/datasource/data_source.dart';
import 'package:mula_biz_mobile/features/forgot_password/data/model/reset_password/approve_reset_password.dart';
import 'package:mula_biz_mobile/features/forgot_password/data/model/reset_password/reset_password.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/approve_reset_password_response.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/approve_reset_password.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/reset_password_entity.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/reset_password_response.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/repository/reset_password_repository.dart';

@Injectable(as: ResetPasswordRepository)
class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  ResetPasswordRepositoryImpl(this._remoteDataSource, this._localStorage);

  final DataSource _remoteDataSource;
  final LocalStorage _localStorage;
  @override
  Future<Either<BaseError, ApproveResetPasswordResponseEntity>>
      approveResetPassword(
          ApproveResetPasswordEntity approveResetPasswordEntity) async {
    try {
      final result = await _remoteDataSource.approveResetPassword(
          approveResetPasswordEntity: ApproveResetPassword(
        otp: approveResetPasswordEntity.otp,
        ref: approveResetPasswordEntity.ref,
      ));
      await _localStorage.save(
          SPKeys.accessToken.name, result.data?.attributes.accessToken);
      return right((result.data ?? []) as ApproveResetPasswordResponseEntity);
    } on DioException catch (exception) {
      final data = exception.response!.data as Map<String, dynamic>;
      final error = (data['errors'] as List<dynamic>).first;
      final title = error['title'];
      final detail = error['detail'];
      if (title != '') {
        return left(BaseError.messageError(title, detail));
      }
      return left(exception.baseError);
    }
  }

  @override
  Future<Either<BaseError, ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordEntity resetPasswordEntity) async {
    try {
      final result = await _remoteDataSource.resetPassword(
          resetPasswordEntity: ResetPassword(
              email: resetPasswordEntity.email,
              phone: resetPasswordEntity.phone,
              password: resetPasswordEntity.password,
              uid: resetPasswordEntity.uid));
      return right((result.data ?? []) as ResetPasswordResponseEntity);
    } on DioException catch (exception) {
      final data = exception.response!.data as Map<String, dynamic>;
      final error = (data['errors'] as List<dynamic>).first;
      final title = error['title'];
      final detail = error['detail'];
      if (title != '') {
        return left(BaseError.messageError(title, detail));
      }
      return left(exception.baseError);
    }
  }
}
