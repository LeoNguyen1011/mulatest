import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/features/core/domain/repositories/auth_repository.dart';

@Injectable()
class GetUserProfileUseCase {
  GetUserProfileUseCase(this.authRepository);

  final AuthRepository authRepository;

  Future<void> call() {
    return authRepository.getUserProfile();
  }
}
