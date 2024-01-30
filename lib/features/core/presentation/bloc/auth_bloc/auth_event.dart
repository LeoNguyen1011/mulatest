part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.init() = Init;
  const factory AuthEvent.changeIndex(int i) = ChangeIndex;

  const factory AuthEvent.logout() = Logout;
  const factory AuthEvent.getUserProfile() = GetUserProfile;
}
