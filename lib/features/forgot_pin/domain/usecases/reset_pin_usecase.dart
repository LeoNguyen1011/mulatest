import 'package:dartz/dartz.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/entity/reset_pin_entity.dart';
import 'package:mula_biz_mobile/features/forgot_pin/domain/entity/reset_pin_response.dart';

abstract class ResetPinUseCase {
  Future<Either<BaseError, ResetPinResponseEntity>> resetPin(
      {required ResetPinEntity resetPinEntity});
}
