// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'my_wallet_cubit.dart';

class SignInState extends Equatable {
  final BaseStateStatus status;
  final String errorMessage;

  const SignInState({
    this.status = BaseStateStatus.init,
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];

  SignInState copyWith({
    BaseStateStatus? status,
    String? errorMessage,
    String? passwordForPressSignInButton,
  }) {
    return SignInState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
