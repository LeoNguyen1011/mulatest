import 'package:mula_biz_mobile/features/sign_in/data/model/signin/signin_response.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/entity/signin_entity.dart';

import '../../../../../base/network/models/base_data.dart';

abstract class DataSource {
  Future<BaseData<SignInResponseModelData>> signInWithPassword({
    required SignInWithPasswordEntity signInWithPasswordEntity,
  });
  Future<BaseData<SignInResponseModelData>> signInWithPin({
    required SignInWithPinEntity signInWithPinEntity,
  });
}
