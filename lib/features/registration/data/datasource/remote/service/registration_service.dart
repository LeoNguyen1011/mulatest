// ignore_for_file: type=lint

import 'package:mula_biz_mobile/base/network/models/base_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/approve_change_device_response.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/change_device_response.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/send_activation_response.dart';
import 'package:mula_biz_mobile/features/registration/data/model/registration/otp_response.dart';
import 'package:mula_biz_mobile/features/registration/data/model/registration/registration_response.dart';
import 'package:retrofit/http.dart';
part "registration_service.g.dart";

@RestApi()
@Injectable()
abstract class RegistrationService {
  @factoryMethod
  factory RegistrationService(Dio dio) = _RegistrationService;

  @POST('/registrations?lang={lang}')
  Future<BaseData<RegistrationResponseModelData>> activateAccount({
    @Body() required Map<String, dynamic> body,
    @Query("lang") required String lang,
  });

  @PATCH('/otp/approve?lang={lang}')
  Future<BaseData<OtpResponseModelData>> approveAccount({
    @Body() required Map<String, dynamic> body,
    @Query("lang") required String lang,
  });

  @POST('/device/send_activation_code?lang={lang}')
  Future<BaseData<SendActivationResponseModelData>> sendActivationCode({
    @Body() required Map<String, dynamic> body,
    @Query("lang") required String lang,
  });

  @POST('/device/change_pin_device?lang={lang}')
  Future<BaseData<ChangeDeviceResponseModelData>> changeDevice({
    @Body() required Map<String, dynamic> body,
    @Query("lang") required String lang,
  });

  @PATCH('/otp/approve?lang={lang}')
  Future<BaseData<ApproveChangeDeviceResponseModelData>> approveChangeDevice({
    @Body() required Map<String, dynamic> body,
    @Query("lang") required String lang,
  });
}
