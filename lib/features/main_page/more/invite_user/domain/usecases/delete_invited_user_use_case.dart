import 'package:mula_biz_mobile/features/main_page/more/invite_user/data/models/requests/delete_user_request.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/domain/repository/invite_user_repository.dart';

class DeleteInvitedUserUseCase {
  DeleteInvitedUserUseCase(this._repo);

  final InviteUserRepository _repo;

  Future<void> deleteInvitedUserUseCase({required DeleteUserRequest request}) {
    return _repo.deleteInvitedUser(request);
  }
}
