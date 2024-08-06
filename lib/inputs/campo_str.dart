import 'package:formz/formz.dart';

// Enum para los posibles errores del campo de texto
enum CampoNombreTableroError { empty }

class CampoNombreTablero extends FormzInput<String, CampoNombreTableroError> {
  const CampoNombreTablero.pure() : super.pure('');
  const CampoNombreTablero.dirty(String value) : super.dirty(value);

  @override
  CampoNombreTableroError? validator(String value) {
    if (value.isEmpty) return CampoNombreTableroError.empty;
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == CampoNombreTableroError.empty) return 'Este campo es requerido';
    return null;
  }
}
