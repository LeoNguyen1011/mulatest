import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/base/network/models/base_data.dart';
import 'package:mula_biz_mobile/common/multi_languages/localize_helper.dart';
import 'package:mula_biz_mobile/features/sign_in/data/datasource/data_source.dart';
import 'package:mula_biz_mobile/features/sign_in/data/datasource/remote/service/signin_service.dart';
import 'package:mula_biz_mobile/features/sign_in/data/model/signin/signin_response.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/entity/signin_entity.dart';

@Injectable(as: DataSource)
class DataSourceImpl implements DataSource {
  final SignInService _signInService;

  DataSourceImpl(this._signInService);

  @override
  Future<BaseData<SignInResponseModelData>> signInWithPassword(
      {required SignInWithPasswordEntity signInWithPasswordEntity}) async {
    return _signInService.signIn(body: {
      "auth_type": "password",
      "password": signInWithPasswordEntity.password,
      "uid": signInWithPasswordEntity.uid,
      "data": {
        "attributes": {
          "name": signInWithPasswordEntity.name,
          "os": signInWithPasswordEntity.os,
          "model": signInWithPasswordEntity.model
        }
      },
    }, lang: await LocalizeHelper.getCurrentLanguage);
  }

  @override
  Future<BaseData<SignInResponseModelData>> signInWithPin(
      {required SignInWithPinEntity signInWithPinEntity}) async {
    return _signInService.signIn(
      body: {
        "auth_type": "pin",
        "pin": signInWithPinEntity.pin,
        "uid": signInWithPinEntity.uid,
      },
      lang: await LocalizeHelper.getCurrentLanguage,
    );
  }
}
