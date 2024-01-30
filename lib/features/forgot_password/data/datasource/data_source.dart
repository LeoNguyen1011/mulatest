import 'package:mula_biz_mobile/features/forgot_password/data/model/reset_password/approve_reset_password_response.dart';
import 'package:mula_biz_mobile/features/forgot_password/data/model/reset_password/reset_password_response.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/approve_reset_password.dart';
import 'package:mula_biz_mobile/features/forgot_password/domain/entity/reset_password_entity.dart';
import '../../../../../base/network/models/base_data.dart';

abstract class DataSource {
  Future<BaseData<ApproveResetPasswordResponseModelData>> approveResetPassword({
    required ApproveResetPasswordEntity approveResetPasswordEntity,
  });
  Future<BaseData<ResetPasswordResponseModelData>> resetPassword({
    required ResetPasswordEntity resetPasswordEntity,
  });
}
