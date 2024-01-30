class SignInWithPasswordEntity {
  const SignInWithPasswordEntity({
    required this.password,
    required this.uid,
    required this.name,
    required this.os,
    required this.model,
  });

  final String password;
  final String uid;
  final String name;
  final String os;
  final String model;
}

class SignInWithPinEntity {
  const SignInWithPinEntity({
    required this.uid,
    required this.pin,
  });

  final String uid;
  final String pin;
}
