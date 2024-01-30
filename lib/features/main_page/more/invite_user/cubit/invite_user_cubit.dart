import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/di/di_setup.dart';
import 'package:mula_biz_mobile/features/core/data/models/user_profile_response.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/data/models/requests/delete_user_request.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/data/models/requests/send_invites_request.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/domain/repository/invite_user_repository.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/domain/usecases/delete_invited_user_use_case.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/domain/usecases/get_list_invited_users_use_case.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/domain/usecases/send_invites_use_case.dart';

part 'invite_user_state.dart';

class InviteUserCubit extends Cubit<InviteUserState> {
  InviteUserCubit() : super(const InviteUserState());

  final SendInvitesUseCase _sendInviteUserCase =
      SendInvitesUseCase(getIt<InviteUserRepository>());
  final DeleteInvitedUserUseCase _deleteInvitedUserUseCase =
      DeleteInvitedUserUseCase(getIt<InviteUserRepository>());

  final GetListInvitedUsersUseCase _getListInvitedUsersUseCase =
      GetListInvitedUsersUseCase(getIt<InviteUserRepository>());

  void addUser({
    required SendInvitesRequest request,
    required bool isResend,
  }) async {
    emit(state.copyWith(addUserStatus: BaseStateStatus.loading));
    try {
      await _sendInviteUserCase.sendInvites(
        request: request,
        isResend: isResend,
      );

      emit(state.copyWith(addUserStatus: BaseStateStatus.success));
    } on DioException catch (e) {
      emit(state.copyWith(
        addUserStatus: BaseStateStatus.failed,
        errorMsg: e.message,
      ));
    }
  }

  void getListInvitedUser() async {
    emit(state.copyWith(getListUserStatus: BaseStateStatus.loading));
    try {
      final data = await _getListInvitedUsersUseCase.getListInvitedUsers();

      emit(state.copyWith(
          getListUserStatus: BaseStateStatus.success, listUsers: data));
    } on DioException catch (e) {
      emit(state.copyWith(
          getListUserStatus: BaseStateStatus.failed, errorMsg: e.message));
    }
  }

  void deleteInvitedUser({required DeleteUserRequest request}) async {
    emit(state.copyWith(deleteUserStatus: BaseStateStatus.loading));
    try {
      await _deleteInvitedUserUseCase.deleteInvitedUserUseCase(
          request: request);

      emit(state.copyWith(deleteUserStatus: BaseStateStatus.success));
    } on DioException catch (e) {
      emit(state.copyWith(
          deleteUserStatus: BaseStateStatus.failed, errorMsg: e.message));
    }
  }
}
