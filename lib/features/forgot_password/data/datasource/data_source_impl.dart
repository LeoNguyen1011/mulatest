import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/base/network/models/base_data.dart';
import 'package:mula_biz_mobile/common/multi_languages/localize_helper.dart';
import 'package:mula_biz_mobile/features/forgot_password/data/datasource/data_source.dart';

import 'package:mula_biz_mobile/features/forgot_password/data/datasource/remote/service/reset_password_service.dart';
import 'package:mula_biz_mobile/features/forgot_password/data/model/reset_password/approve_reset_password_response.dart';
import 'package:mula_biz_mobile/features/forgot_password/data/model/reset_password/reset_password_response.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/approve_reset_password.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/reset_password_entity.dart';

@Injectable(as: DataSource)
class DataSourceImpl implements DataSource {
  final ResetPasswordService _resetPasswordService;

  DataSourceImpl(this._resetPasswordService);

  @override
  Future<BaseData<ApproveResetPasswordResponseModelData>> approveResetPassword({
    required ApproveResetPasswordEntity approveResetPasswordEntity,
  }) async {
    return _resetPasswordService.approveResetPassword(
      body: {
        "mode": "forgot_password",
        "ref": approveResetPasswordEntity.ref,
        "otp": approveResetPasswordEntity.otp
      },
      lang: await LocalizeHelper.getCurrentLanguage,
    );
  }

  @override
  Future<BaseData<ResetPasswordResponseModelData>> resetPassword(
      {required ResetPasswordEntity resetPasswordEntity}) async {
    return _resetPasswordService.resetPassword(body: {
      "email": resetPasswordEntity.email,
      "phone": resetPasswordEntity.phone,
      "new_password": resetPasswordEntity.password,
      "uid": resetPasswordEntity.uid
    }, lang: await LocalizeHelper.getCurrentLanguage);
  }
}
