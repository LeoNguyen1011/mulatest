import 'package:dartz/dartz.dart';
import 'package:mula_biz_mobile/base/network/errors/error.dart';

abstract class AuthRepository {
  Future<Either<BaseError, void>> checkToken();

  Future<Either<LogOutError, void>> logOut();
  Future<void> getUserProfile();
}
