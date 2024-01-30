// ignore_for_file: type=lint

import 'package:mula_biz_mobile/base/network/models/base_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/features/forgot_pin/data/model/reset_pin/reset_pin_response.dart';
import 'package:retrofit/http.dart';

part 'reset_pin_service.g.dart';

@RestApi()
@Injectable()
abstract class ResetPinService {
  @factoryMethod
  factory ResetPinService(Dio dio) = _ResetPinService;

  @PATCH('/pin_code/reset_pin?lang={lang}')
  Future<BaseData<ResetPinResponseModelData>> resetPin({
    @Body() required Map<String, dynamic> body,
    @Query("lang") required String lang,
  });
}
