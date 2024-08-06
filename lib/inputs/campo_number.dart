import 'package:formz/formz.dart';

// Enum para los posibles errores del campo de número
enum CampoVoltajeError { empty, invalid, negative }

class CampoVoltaje extends FormzInput<String, CampoVoltajeError> {
  const CampoVoltaje.pure() : super.pure('');
  const CampoVoltaje.dirty(String value) : super.dirty(value);

  @override
  CampoVoltajeError? validator(String value) {
    if (value.isEmpty) return CampoVoltajeError.empty;
    final number = double.tryParse(value);
    if (number == null) return CampoVoltajeError.invalid;
    if (number <= 0) return CampoVoltajeError.negative;
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == CampoVoltajeError.empty) return 'Este campo es requerido';
    if (displayError == CampoVoltajeError.invalid) return 'Debe ser un número válido';
    if (displayError == CampoVoltajeError.negative) return 'Debe ser mayor a 0';
    return null;
  }
}
