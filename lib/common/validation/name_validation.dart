import 'package:formz/formz.dart';

enum NameValidationError { empty, invalid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);
  static final RegExp _nameRegExp = RegExp(
    r'^[A-Za-z0-9]+$',
  );

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) {
      return NameValidationError.empty;
    }
    return _nameRegExp.hasMatch(value) ? null : NameValidationError.invalid;
  }

  static String getError(NameValidationError value) {
    switch (value) {
      case NameValidationError.empty:
        return 'validators.field_empty';
      case NameValidationError.invalid:
        return 'validators.invalid_name';
    }
  }
}
