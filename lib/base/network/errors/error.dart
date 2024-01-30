import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';

@freezed
class BaseError with _$BaseError {
  const factory BaseError.httpInternalServerError(String errorBody) =
      HttpInternalServerError;

  const factory BaseError.httpUnAuthorizedError() = HttpUnAuthorizedError;

  const factory BaseError.httpUnknownError(String message) = HttpUnknownError;

  const factory BaseError.logOutError() = LogOutError;

  const factory BaseError.deviceTakenError(String message) = DeviceTakenError;

  const factory BaseError.activationCodeError(String message) =
      ActivationCodeError;

  const factory BaseError.invitationEmailError(String message) =
      InvitationEmailError;

  const factory BaseError.phoneNumberError(String message) = PhoneNumberError;

  const factory BaseError.mailAlreadyError(String message) = MailAlreadyError;

  const factory BaseError.messageError(String title, String detail) =
      MessageError;
}
