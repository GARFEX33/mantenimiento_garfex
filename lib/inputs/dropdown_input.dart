import 'package:formz/formz.dart';

// Enum para los posibles errores del campo dropdown
enum DropdownError { empty }

class DropdownInput extends FormzInput<String, DropdownError> {
  const DropdownInput.pure() : super.pure('');
  const DropdownInput.dirty(String value) : super.dirty(value);

  @override
  DropdownError? validator(String value) {
    if (value.isEmpty) return DropdownError.empty;
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == DropdownError.empty) return 'Este campo es obligatorio';
    return null;
  }
}
