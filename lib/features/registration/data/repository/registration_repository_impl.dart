import 'package:mula_biz_mobile/base/network/errors/error.dart';
import 'package:mula_biz_mobile/base/network/errors/extension.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/local_data/sp_keys.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/features/registration/data/datasource/registration_data_source.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/approve_change_device.dart';
import 'package:mula_biz_mobile/features/registration/data/model/change_device/change_device_model.dart';
import 'package:mula_biz_mobile/features/registration/data/model/registration/registration.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/approve_change_device_entity.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/approve_change_device_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/change_device_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/otp_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/registration_entity.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/registration_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/entity/send_activation_response.dart';
import 'package:mula_biz_mobile/features/registration/domain/repository/registration_repository.dart';

@Injectable(as: RegistrationRepository)
class RegistrationRepositoryImpl implements RegistrationRepository {
  RegistrationRepositoryImpl(this._remoteDataSource, this._localStorage);

  final RegistrationDataSource _remoteDataSource;
  final LocalStorage _localStorage;
  @override
  Future<Either<BaseError, OtpResponse>> approveAccount(
      {required String otp, required String lang, required String ref}) async {
    try {
      final result = await _remoteDataSource.approveAccount(
          otp: otp, ref: ref, mode: "verify_registration");
      await _localStorage.save(
          SPKeys.deviceId.name, result.data?.attributes.deviceId);
      await _localStorage.save(
          SPKeys.accessToken.name, result.data?.attributes.accessToken);

      return right((result.data ?? []) as OtpResponse);
    } on DioException catch (exception) {
      return left(exception.baseError);
    }
  }

  @override
  Future<Either<BaseError, RegistrationResponseEntity>> activateAccount(
      RegistrationEntity registrationEntity) async {
    try {
      final result = await _remoteDataSource.activateAccount(
          registration: Registration(
              firstName: registrationEntity.firstName,
              lastName: registrationEntity.lastName,
              password: registrationEntity.password,
              phone: registrationEntity.phone,
              email: registrationEntity.email,
              uid: registrationEntity.uid,
              name: registrationEntity.name,
              model: registrationEntity.model,
              os: registrationEntity.os,
              invitationCode: registrationEntity.invitationCode,
              faceImage: registrationEntity.faceImage,
              lang: registrationEntity.lang,
              pin: registrationEntity.pin));

      return right((result.data ?? []) as RegistrationResponseEntity);
    } on DioException catch (exception) {
      final data = exception.response!.data;
      final error = (data['errors'] as List<dynamic>).first;
      final title = error['title'];
      final detail = error['detail'];
      if (title != '') {
        return left(BaseError.messageError(title, detail));
      }
      return left(exception.baseError);
    }
  }

  @override
  Future<Either<BaseError, ApproveChangeDeviceResponseEntity>>
      approveChangeDevice(
          ApproveChangeDeviceEntity approveChangeDeviceEntity) async {
    try {
      final result = await _remoteDataSource.approveChangeDevice(
          approveChangeDeviceEntity: ApproveChangeDevice(
        otp: approveChangeDeviceEntity.otp,
        ref: approveChangeDeviceEntity.ref,
      ));
      await _localStorage.save(
          SPKeys.deviceId.name, result.data?.attributes.deviceId);
      await _localStorage.save(
          SPKeys.accessToken.name, result.data?.attributes.accessToken);
      return right((result.data ?? []) as ApproveChangeDeviceResponseEntity);
    } on DioException catch (exception) {
      return left(exception.baseError);
    }
  }

  @override
  Future<Either<BaseError, ChangeDeviceResponseEntity>> changeDevice(
      ChangeDeviceModel changeDeviceEntity) async {
    try {
      final result = await _remoteDataSource.changeDevice(
          changeDeviceEntity: ChangeDeviceModel(
              activationCode: changeDeviceEntity.activationCode,
              phone: changeDeviceEntity.phone,
              uid: changeDeviceEntity.uid,
              name: changeDeviceEntity.name,
              model: changeDeviceEntity.model,
              os: changeDeviceEntity.os,
              faceImage: changeDeviceEntity.faceImage,
              lang: changeDeviceEntity.lang,
              pin: changeDeviceEntity.pin));

      return right((result.data ?? []) as ChangeDeviceResponseEntity);
    } on DioException catch (exception) {
      if (exception.response != null) {
        final data = exception.response?.data as Map<String, dynamic>;
        final error = (data['errors'] as List<dynamic>).first;
        final title = error['title'];
        final detail = error['detail'];
        return left(BaseError.messageError(title, detail));
      } else {
        return left(exception.baseError);
      }
    }
  }

  @override
  Future<Either<BaseError, SendActivationResponseEntity>> sendActivationCode(
      {required String email}) async {
    try {
      final result = await _remoteDataSource.sendActivationCode(email: email);
      return right(SendActivationResponseEntity(
        message: result.data?.message ?? 'Unknown error',
      ));
    } on DioException catch (exception) {
      if (exception.response != null) {
        final data = exception.response?.data as Map<String, dynamic>;
        final error = (data['errors'] as List<dynamic>).first;
        final title = error['title'];
        final detail = error['detail'];
        return left(BaseError.messageError(title, detail));
      } else {
        return left(exception.baseError);
      }
    }
  }
}
