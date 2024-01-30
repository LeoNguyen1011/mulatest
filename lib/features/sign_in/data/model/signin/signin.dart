import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/entity/signin_entity.dart';

part 'signin.freezed.dart';

part 'signin.g.dart';

@freezed
class SignInWithPasswordModelData extends SignInWithPasswordEntity
    with _$SignInWithPasswordModelData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SignInWithPasswordModelData({
    required final String password,
    required final String uid,
    required final String name,
    required final String os,
    required final String model,
  }) = _SignInWithPasswordModelData;

  factory SignInWithPasswordModelData.fromJson(Map<String, dynamic> json) =>
      _$SignInWithPasswordModelDataFromJson(json);
}

@freezed
class SignInWithPinModelData extends SignInWithPinEntity
    with _$SignInWithPinModelData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SignInWithPinModelData({
    required final String pin,
    required final String uid,
  }) = _SignInWithPinModelData;

  factory SignInWithPinModelData.fromJson(Map<String, dynamic> json) =>
      _$SignInWithPinModelDataFromJson(json);
}
