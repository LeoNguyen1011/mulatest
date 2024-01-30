import 'package:mula_biz_mobile/features/core/data/models/user_profile_response.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/domain/repository/invite_user_repository.dart';

class GetListInvitedUsersUseCase {
  GetListInvitedUsersUseCase(this._repo);

  final InviteUserRepository _repo;

  Future<List<UserProfileResponse>> getListInvitedUsers() {
    return _repo.getListInvitedUsers();
  }
}
