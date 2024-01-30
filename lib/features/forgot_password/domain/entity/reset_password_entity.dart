class ResetPasswordEntity {
  final String email;
  final String phone;
  final String password;
  final String uid;

  ResetPasswordEntity(
      {required this.email,
      required this.phone,
      required this.password,
      required this.uid});
}
