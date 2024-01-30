import 'package:mula_biz_mobile/features/forgot_pin/data/model/reset_pin/reset_pin_response.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/entity/reset_pin_entity.dart';

import '../../../../../base/network/models/base_data.dart';

abstract class DataSource {
  Future<BaseData<ResetPinResponseModelData>> resetPin({
    required ResetPinEntity resetPinEntity,
  });
}
