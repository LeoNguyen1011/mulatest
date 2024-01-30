import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/base/network/models/base_data.dart';
import 'package:mula_biz_mobile/features/core/data/models/refresh_token_response.dart';
import 'package:mula_biz_mobile/features/core/data/models/token_refresh_request.dart';
import 'package:mula_biz_mobile/features/core/data/models/user_profile_response.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@RestApi()
@injectable
abstract class AuthService {
  @factoryMethod
  factory AuthService(Dio dio) = _AuthService;

  @PATCH('/tokens/refresh?lang=en')
  Future<RefreshTokenResponse> checkToken(
      {@Body() required TokenRefreshRequestBody body});

  @GET('/me?lang={lang}')
  Future<BaseData<UserProfileResponse>> getUserProfile({
    @Query('lang') required String lang,
  });
}
