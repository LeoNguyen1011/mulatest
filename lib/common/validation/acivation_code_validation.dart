import 'package:formz/formz.dart';

enum ActivationCodeValidationError { empty, invalid }

class ActivationCode extends FormzInput<String, ActivationCodeValidationError> {
  const ActivationCode.pure() : super.pure('');
  const ActivationCode.dirty([String value = '']) : super.dirty(value);
  @override
  ActivationCodeValidationError? validator(String value) {
    if (value.isEmpty) {
      return ActivationCodeValidationError.empty;
    }
    return value != '' ? null : ActivationCodeValidationError.invalid;
  }

  static String getError(ActivationCodeValidationError value) {
    switch (value) {
      case ActivationCodeValidationError.empty:
        return 'validators.field_empty';
      case ActivationCodeValidationError.invalid:
        return 'validators.invalid_activation_code';
    }
  }
}
