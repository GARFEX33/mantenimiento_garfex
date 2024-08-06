import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_validation_provider.g.dart';

@riverpod
class FormValidation extends _$FormValidation {
  @override
  String build() {
    return '';
  }

  String? validateTablero(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa el tablero';
    }
    return null;
  }

  String? validateMantenimiento(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, selecciona el mantenimiento';
    }
    return null;
  }

  bool validateForm(String? mantenimiento, String? tablero) {
    if (validateMantenimiento(mantenimiento) != null ||
        validateTablero(tablero) != null) {
      return false;
    }
    return true;
  }
}
