import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/features/core/domain/repositories/auth_repository.dart';

abstract class LogOutUseCase {
  Future<Either<LogOutError, void>> call();
}

@Injectable(as: LogOutUseCase)
class LogOutUseCaseImpl implements LogOutUseCase {
  const LogOutUseCaseImpl(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<LogOutError, void>> call() {
    return authRepository.logOut();
  }
}
