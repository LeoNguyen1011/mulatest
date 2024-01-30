import 'package:mula_biz_mobile/features/core/data/models/user_profile_response.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/data/models/requests/delete_user_request.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/data/models/requests/send_invites_request.dart';

abstract class InviteUserRepository {
  Future<void> sendInvites({
    required SendInvitesRequest request,
    required bool isResend,
  });
  Future<List<UserProfileResponse>> getListInvitedUsers();
  Future<void> deleteInvitedUser(DeleteUserRequest request);
}
