import 'package:mula_biz_mobile/features/main_page/more/invite_user/data/models/requests/send_invites_request.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/domain/repository/invite_user_repository.dart';

class SendInvitesUseCase {
  SendInvitesUseCase(this._repo);

  final InviteUserRepository _repo;

  Future<void> sendInvites({
    required SendInvitesRequest request,
    required bool isResend,
  }) {
    return _repo.sendInvites(
      request: request,
      isResend: isResend,
    );
  }
}
