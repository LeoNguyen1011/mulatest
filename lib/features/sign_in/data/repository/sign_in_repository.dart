import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/base/network/errors/extension.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/common/enums/auth_type_enum.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/local_data/sp_keys.dart';
import 'package:mula_biz_mobile/features/sign_in/data/datasource/data_source.dart';
import 'package:mula_biz_mobile/features/sign_in/data/model/signin/signin.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/entity/sign_in_response.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/entity/signin_entity.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/repository/sign_in_repository.dart';

@Injectable(as: SignInRepository)
class SignInRepositoryImpl implements SignInRepository {
  SignInRepositoryImpl(this._remoteDataSource, this._localStorage);

  final DataSource _remoteDataSource;
  final LocalStorage _localStorage;

  @override
  Future<Either<BaseError, SignInResponseEntity>> signInWithPassword(
      SignInWithPasswordEntity signInWithPasswordEntity) async {
    try {
      final result = await _remoteDataSource.signInWithPassword(
          signInWithPasswordEntity: SignInWithPasswordModelData(
              password: signInWithPasswordEntity.password,
              uid: signInWithPasswordEntity.uid,
              name: signInWithPasswordEntity.name,
              os: signInWithPasswordEntity.os,
              model: signInWithPasswordEntity.model));
      await _localStorage.save(
          SPKeys.accessToken.name, result.data?.attributes.accessToken);
      if (result.data?.attributes.accessToken != null) {
        return right((result.data ?? []) as SignInResponseEntity);
      } else {
        return left(const BaseError.httpInternalServerError('Error'));
      }
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
  Future<Either<BaseError, SignInResponseEntity>> signInWithPin({
    required AuthType authType,
    required String encryptedPin,
    required String uid,
  }) async {
    try {
      final result = await _remoteDataSource.signInWithPin(
          signInWithPinEntity: SignInWithPinModelData(
        pin: encryptedPin,
        uid: uid,
      ));
      await _localStorage.save(
          SPKeys.accessToken.name, result.data?.attributes.accessToken);
      await _localStorage.save(
          'refreshToken', result.data?.attributes.refreshToken);
      if (result.data?.attributes.accessToken != null) {
        return right((result.data ?? []) as SignInResponseEntity);
      } else {
        return left(const BaseError.httpInternalServerError('Error'));
      }
    } on DioException catch (exception) {
      final data = exception.response?.data as Map<String, dynamic>;
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
