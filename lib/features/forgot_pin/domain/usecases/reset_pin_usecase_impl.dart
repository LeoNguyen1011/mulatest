import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/entity/reset_pin_entity.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/entity/reset_pin_response.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/repository/reset_pin_repository.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/usecases/reset_pin_usecase.dart';

@Injectable(as: ResetPinUseCase)
class ResetPinUseCaseImpl implements ResetPinUseCase {
  ResetPinUseCaseImpl(this._coreRepo);

  final ResetPinRepository _coreRepo;

  @override
  Future<Either<BaseError, ResetPinResponseEntity>> resetPin(
      {required ResetPinEntity resetPinEntity}) {
    return _coreRepo.resetPin(resetPinEntity);
  }
}
