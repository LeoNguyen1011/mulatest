class ValidationHelper {
  static final RegExp _mobileNumberRegExp = RegExp(
    r'(^\+?(0|66|85)[0-9]{8,13}$)',
  );

  static RegExp nameRegExp = RegExp(
    r'^[A-Za-z0-9]+$',
  );

  static RegExp emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  static bool validatorPhoneNumber(String value) {
    if (value.length < 8) {
      return false;
    }
    if (value.length > 13) {
      return false;
    }
    return _mobileNumberRegExp.hasMatch(value);
  }

  static bool validatorPassword(String value) {
    if (value.length < 8) {
      return false;
    } else if (value.length > 30) {
      return false;
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return false;
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return false;
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return false;
    } else if (!value
        .contains(RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+=' "'" ']'))) {
      return false;
    }
    return true;
  }
}
