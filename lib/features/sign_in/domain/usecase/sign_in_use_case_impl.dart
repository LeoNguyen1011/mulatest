import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/common/enums/auth_type_enum.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/entity/sign_in_response.dart';

import 'package:mula_biz_mobile/features/sign_in/domain/entity/signin_entity.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/repository/sign_in_repository.dart';
import 'package:mula_biz_mobile/features/sign_in/domain/usecase/sign_in_use_case.dart';

@Injectable(as: SignInUseCase)
class SignInUseCaseImpl implements SignInUseCase {
  SignInUseCaseImpl(this._coreRepo);

  final SignInRepository _coreRepo;

  @override
  Future<Either<BaseError, SignInResponseEntity>> signInWithPassword({
    required SignInWithPasswordEntity signInWithPassword,
  }) {
    return _coreRepo.signInWithPassword(signInWithPassword);
  }

  @override
  Future<Either<BaseError, SignInResponseEntity>> signInWithPin({
    required AuthType authType,
    required String encryptedPin,
    required String uid,
  }) {
    return _coreRepo.signInWithPin(
      authType: authType,
      encryptedPin: encryptedPin,
      uid: uid,
    );
  }
}
