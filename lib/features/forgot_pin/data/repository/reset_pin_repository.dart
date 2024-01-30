import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/base/network/errors/extension.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/local_data/sp_keys.dart';
import 'package:mula_biz_mobile/features/forgot_pin/data/datasource/data_source.dart';
import 'package:mula_biz_mobile/features/forgot_pin/data/model/reset_pin/reset_pin.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/entity/reset_pin_entity.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/entity/reset_pin_response.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/repository/reset_pin_repository.dart';

@Injectable(as: ResetPinRepository)
class ResetPinRepositoryImpl implements ResetPinRepository {
  ResetPinRepositoryImpl(this._remoteDataSource, this._localStorage);

  final DataSource _remoteDataSource;
  final LocalStorage _localStorage;
  @override
  Future<Either<BaseError, ResetPinResponseEntity>> resetPin(
      ResetPinEntity resetPinEntity) async {
    try {
      final result = await _remoteDataSource.resetPin(
          resetPinEntity: ResetPin(
              pin: resetPinEntity.pin,
              password: resetPinEntity.password,
              uid: resetPinEntity.uid));
      await _localStorage.save(
          SPKeys.accessToken.name, result.data?.attributes.accessToken);
      await LocalStorageImpl().get(SPKeys.accessToken.name);
      return right((result.data ?? []) as ResetPinResponseEntity);
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
