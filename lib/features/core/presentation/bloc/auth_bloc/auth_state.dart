part of 'auth_bloc.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  unknown,
}

@CopyWith()
class AuthState extends BaseBlocState {
  const AuthState({
    required super.status,
    super.message,
    this.authStatus,
  });

  final AuthenticationStatus? authStatus;

  factory AuthState.init() {
    return const AuthState(
      status: BaseStateStatus.init,
      authStatus: AuthenticationStatus.unknown,
    );
  }

  factory AuthState.authenticated() {
    return const AuthState(
      status: BaseStateStatus.success,
      authStatus: AuthenticationStatus.authenticated,
    );
  }

  factory AuthState.unauthenticated() {
    return const AuthState(
      status: BaseStateStatus.failed,
      authStatus: AuthenticationStatus.unauthenticated,
    );
  }

  @override
  List get props => [
        status,
        message,
        authStatus,
      ];
}
