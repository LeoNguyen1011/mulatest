// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'invite_user_cubit.dart';

class InviteUserState extends Equatable {
  final BaseStateStatus addUserStatus;
  final BaseStateStatus getListUserStatus;
  final BaseStateStatus deleteUserStatus;
  final String errorMsg;
  final List<UserProfileResponse> listUsers;

  const InviteUserState({
    this.addUserStatus = BaseStateStatus.init,
    this.getListUserStatus = BaseStateStatus.init,
    this.deleteUserStatus = BaseStateStatus.init,
    this.errorMsg = '',
    this.listUsers = const [],
  });
  @override
  List<Object> get props =>
      [addUserStatus, getListUserStatus, errorMsg, listUsers, deleteUserStatus];

  InviteUserState copyWith({
    BaseStateStatus? addUserStatus,
    BaseStateStatus? getListUserStatus,
    BaseStateStatus? deleteUserStatus,
    String? errorMsg,
    List<UserProfileResponse>? listUsers,
  }) {
    return InviteUserState(
      addUserStatus: addUserStatus ?? this.addUserStatus,
      getListUserStatus: getListUserStatus ?? this.getListUserStatus,
      deleteUserStatus: deleteUserStatus ?? this.deleteUserStatus,
      errorMsg: errorMsg ?? this.errorMsg,
      listUsers: listUsers ?? this.listUsers,
    );
  }
}
