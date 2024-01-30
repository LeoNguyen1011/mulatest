// ignore_for_file: type=lint

import 'package:mula_biz_mobile/base/network/models/base_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/features/forgot_password/data/model/reset_password/approve_reset_password_response.dart';
import 'package:mula_biz_mobile/features/forgot_password/data/model/reset_password/reset_password_response.dart';
import 'package:retrofit/http.dart';

part 'reset_password_service.g.dart';

@RestApi()
@Injectable()
abstract class ResetPasswordService {
  @factoryMethod
  factory ResetPasswordService(Dio dio) = _ResetPasswordService;

  @PATCH('/otp/approve?lang={lang}')
  Future<BaseData<ApproveResetPasswordResponseModelData>> approveResetPassword({
    @Body() required Map<String, dynamic> body,
    @Query("lang") required String lang,
  });

  @PATCH('/passwords/forgot_password?lang={lang}')
  Future<BaseData<ResetPasswordResponseModelData>> resetPassword({
    @Body() required Map<String, dynamic> body,
    @Query("lang") required String lang,
  });
}
