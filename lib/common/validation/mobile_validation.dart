enum MobileValidationError { empty, invalid, short, long }

class MobileValidation {
  static final RegExp mobileNumberRegExp = RegExp(
    r'(^\+?(0|66|85)[0-9]{8,13}$)',
  );

  static MobileValidationError? validator(String value) {
    if (value.isEmpty) {
      return MobileValidationError.empty;
    }
    if (value.length < 8) {
      return MobileValidationError.short;
    }
    if (value.length > 13) {
      return MobileValidationError.long;
    }
    return mobileNumberRegExp.hasMatch(value)
        ? null
        : MobileValidationError.invalid;
  }

  static String? getError(MobileValidationError? value) {
    switch (value) {
      case MobileValidationError.empty:
        return 'validators.field_empty';
      case MobileValidationError.invalid:
        return 'validators.mobile_number_error';
      case MobileValidationError.short:
        return 'validators.mobile_number_error';
      case MobileValidationError.long:
        return 'validators.mobile_number_error';
      case null:
        break;
    }
    return null;
  }
}
