part of 'tablero_form_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class TableroFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final DropdownInput dropdownInput;
  final CampoNombreTablero campoNombreTablero;

  const TableroFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.dropdownInput = const DropdownInput.pure(),
    this.campoNombreTablero = const CampoNombreTablero.pure(),
  });

  TableroFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    DropdownInput? dropdownInput,
    CampoNombreTablero? campoNombreTablero,
  }) {
    return TableroFormState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      dropdownInput: dropdownInput ?? this.dropdownInput,
      campoNombreTablero: campoNombreTablero ?? this.campoNombreTablero,
    );
  }

  @override
  List<Object> get props => [formStatus, isValid, dropdownInput, campoNombreTablero];
}
