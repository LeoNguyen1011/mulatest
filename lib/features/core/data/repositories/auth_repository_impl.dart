import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/base/network/errors/extension.dart';
import 'package:mula_biz_mobile/base/network/models/base_data.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/local_data/sp_keys.dart';
import 'package:mula_biz_mobile/common/multi_languages/localize_helper.dart';
import 'package:mula_biz_mobile/features/core/data/datasources/service/auth_service.dart';
import 'package:mula_biz_mobile/features/core/data/models/token_refresh_request.dart';
import 'package:mula_biz_mobile/features/core/data/models/user_profile_response.dart';
import 'package:mula_biz_mobile/features/core/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(
    this.service,
    this.localStorage,
  );

  final AuthService service;
  final LocalStorage localStorage;

  @override
  Future<Either<BaseError, void>> checkToken() async {
    try {
      final token = await localStorage.get<String>('refreshToken');
      if (token == null || token.isEmpty) {
        return const Left(BaseError.httpUnAuthorizedError());
      }
      await service.checkToken(
        body: TokenRefreshRequestBody(
          refreshToken: token,
        ),
      );
      return const Right(null);
    } on DioException catch (exception) {
      localStorage.clearSession();
      return Left(exception.baseError);
    }
  }

  @override
  Future<Either<LogOutError, void>> logOut() async {
    try {
      await localStorage.remove('refreshToken');
      return const Right(null);
    } on Exception catch (_) {
      return const Left(
        LogOutError(),
      );
    }
  }

  @override
  Future<void> getUserProfile() async {
    try {
      final BaseData<UserProfileResponse> results = await service
          .getUserProfile(lang: await LocalizeHelper.getCurrentLanguage);

      final data = UserProfileResponse.fromJson(results.data?.toJson() ?? {});

      await localStorage.save(
          SPKeys.userProfile.name, data.toJson().toString());
    } on Exception {
      rethrow;
    }
  }
}
