import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:mantenimiento_garfex/inputs/inputs.dart';

part 'tablero_form_state.dart';

class TableroFormCubit extends Cubit<TableroFormState> {
  TableroFormCubit() : super(const TableroFormState());

  void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        dropdownInput: DropdownInput.dirty(state.dropdownInput.value),
        campoNombreTablero: CampoNombreTablero.dirty(state.campoNombreTablero.value),
        isValid: Formz.validate([
          state.dropdownInput,
          state.campoNombreTablero,
        ]),
      ),
    );

    print('Cubit Submit: $state');
  }

  void dropdownChanged(String? value) {
    final dropdownInput = DropdownInput.dirty(value ?? '');
    emit(
      state.copyWith(
        dropdownInput: dropdownInput,
        isValid: Formz.validate([dropdownInput, state.campoNombreTablero]),
      ),
    );
  }

  void campoNombreTableroChanged(String value) {
    final campoNombreTablero = CampoNombreTablero.dirty(value);
    emit(
      state.copyWith(
        campoNombreTablero: campoNombreTablero,
        isValid: Formz.validate([campoNombreTablero, state.dropdownInput]),
      ),
    );
  }
}
