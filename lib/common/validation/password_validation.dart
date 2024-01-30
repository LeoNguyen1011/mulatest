enum PasswordValidationError {
  empty,
  short,
  long,
  noDigit,
  // noLetter,
  noSymbol,
  noLowercase,
  noUppercase,
  match,
}

class Password {
  static PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (value.length < 8) {
      return PasswordValidationError.short;
    } else if (value.length > 30) {
      return PasswordValidationError.long;
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return PasswordValidationError.noDigit;
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return PasswordValidationError.noLowercase;
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return PasswordValidationError.noUppercase;
    } else if (!value
        .contains(RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+=' "'" ']'))) {
      return PasswordValidationError.noSymbol;
    }
    return null;
  }

  static String? getError(PasswordValidationError? value) {
    switch (value) {
      case PasswordValidationError.empty:
        return 'validators.field_empty';
      case PasswordValidationError.short:
        return 'validators.password_error';
      case PasswordValidationError.long:
        return 'validators.password_error';
      case PasswordValidationError.noDigit:
        return 'validators.password_error';
      case PasswordValidationError.noLowercase:
        return 'validators.password_error';
      case PasswordValidationError.noUppercase:
        return 'validators.password_error';
      // case PasswordValidationError.noLetter:
      // return 'Password has no letters';
      case PasswordValidationError.match:
        return 'validators.password_error';
      case PasswordValidationError.noSymbol:
        return 'validators.password_error';
      case null:
        break;
    }
    return null;
  }
}
