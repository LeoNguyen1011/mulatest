import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/common/multi_languages/localize_helper.dart';
import 'package:mula_biz_mobile/features/core/data/models/user_profile_response.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/data/datasource/invitation_api.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/data/models/requests/delete_user_request.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/data/models/requests/send_invites_request.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/domain/repository/invite_user_repository.dart';

@Injectable(as: InviteUserRepository)
class InviteUserRepositoryImpl implements InviteUserRepository {
  InviteUserRepositoryImpl(this.api);

  final InvitationApi api;

  @override
  Future<void> sendInvites({
    required SendInvitesRequest request,
    required bool isResend,
  }) async {
    try {
      await api.sendInvitesApi(
        body: request.toJson(),
        isResend: isResend,
        lang: await LocalizeHelper.getCurrentLanguage,
      );
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> deleteInvitedUser(DeleteUserRequest request) async {
    try {
      await api.deleteInvitedUserApi(
          body: request.toJson(),
          lang: await LocalizeHelper.getCurrentLanguage);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<UserProfileResponse>> getListInvitedUsers() async {
    try {
      final data = await api.getInvitedUserApi(
          lang: await LocalizeHelper.getCurrentLanguage);
      return data.data ?? [];
    } on Exception {
      rethrow;
    }
  }
}
