import 'package:dartz/dartz.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/common/enums/auth_type_enum.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/entity/sign_in_response.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/entity/signin_entity.dart';

abstract class SignInRepository {
  Future<Either<BaseError, SignInResponseEntity>> signInWithPassword(
      SignInWithPasswordEntity signInWithPasswordEntity);

  Future<Either<BaseError, SignInResponseEntity>> signInWithPin({
    required AuthType authType,
    required String encryptedPin,
    required String uid,
  });
}
