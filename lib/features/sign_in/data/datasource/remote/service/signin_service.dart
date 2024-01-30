// ignore_for_file: type=lint

import 'package:mula_biz_mobile/base/network/models/base_data.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/features/sign_in/data/model/signin/signin_response.dart';
import 'package:retrofit/http.dart';

part 'signin_service.g.dart';

@RestApi()
@Injectable()
abstract class SignInService {
  @factoryMethod
  factory SignInService(Dio dio) = _SignInService;

  @POST('/tokens?lang={lang}')
  Future<BaseData<SignInResponseModelData>> signIn({
    @Body() required Map<String, dynamic> body,
    @Query("lang") required String lang,
  });
}
