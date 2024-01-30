import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/base/network/models/base_data.dart';
import 'package:mula_biz_mobile/common/multi_languages/localize_helper.dart';
import 'package:mula_biz_mobile/features/forgot_pin/data/datasource/data_source.dart';
import 'package:mula_biz_mobile/features/forgot_pin/data/datasource/remote/service/reset_pin_service.dart';
import 'package:mula_biz_mobile/features/forgot_pin/data/model/reset_pin/reset_pin_response.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/entity/reset_pin_entity.dart';

@Injectable(as: DataSource)
class DataSourceImpl implements DataSource {
  final ResetPinService _resetPinService;

  DataSourceImpl(this._resetPinService);

  @override
  Future<BaseData<ResetPinResponseModelData>> resetPin(
      {required ResetPinEntity resetPinEntity}) async {
    return _resetPinService.resetPin(
      body: {
        "pin": resetPinEntity.pin,
        "password": resetPinEntity.password,
        "uid": resetPinEntity.uid
      },
      lang: await LocalizeHelper.getCurrentLanguage,
    );
  }
}
