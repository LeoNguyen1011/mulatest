import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/features/core/domain/repositories/auth_repository.dart';

abstract class CheckTokenExpireUseCase {
  Future<Either<BaseError, void>> call();
}

@Injectable(as: CheckTokenExpireUseCase)
class CheckTokeExpireUseCaseImpl implements CheckTokenExpireUseCase {
  CheckTokeExpireUseCaseImpl(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<BaseError, void>> call() {
    return authRepository.checkToken();
  }
}
