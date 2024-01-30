// ignore_for_file: type=lint

import 'package:mula_biz_mobile/base/network/models/base_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/features/core/data/models/user_profile_response.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/data/models/responses/invitation_response.dart';
import 'package:retrofit/http.dart';

part 'invitation_api.g.dart';

@RestApi()
@Injectable()
abstract class InvitationApi {
  @factoryMethod
  factory InvitationApi(Dio dio) = _InvitationApi;

  @POST('/invitations/send_invites?resend={isResend}lang={lang}')
  Future<BaseData<InvitationResponse>> sendInvitesApi({
    @Body() required Map<String, dynamic> body,
    @Query('isResend') required bool isResend,
    @Query('lang') required String lang,
  });

  @GET('/list_users?lang={lang}')
  Future<BaseData<List<UserProfileResponse>>> getInvitedUserApi({
    @Query('lang') required String lang,
  });

  @DELETE('/delete_user?lang={lang}')
  Future<void> deleteInvitedUserApi({
    @Body() required Map<String, dynamic> body,
    @Query('lang') required String lang,
  });
}
