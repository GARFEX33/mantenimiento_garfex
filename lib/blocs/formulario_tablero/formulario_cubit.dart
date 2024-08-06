import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';


class FormularioState {
  final CampoStr nombreTablero;
  final CampoNumber voltaje;
  final FormzStatus status;

  FormularioState({
    this.nombreTablero = const CampoStr.pure(),
    this.voltaje = const CampoNumber.pure(),
    this.status = FormzStatus.pure,
  });

  FormularioState copyWith({
    CampoStr? nombreTablero,
    CampoNumber? voltaje,
    FormzStatus? status,
  }) {
    return FormularioState(
      nombreTablero: nombreTablero ?? this.nombreTablero,
      voltaje: voltaje ?? this.voltaje,
      status: status ?? this.status,
    );
  }
}

class FormularioCubit extends Cubit<FormularioState> {
  FormularioCubit() : super(FormularioState());

  void nombreTableroChanged(String value) {
    final nombreTablero = CampoStr.dirty(value);
    emit(state.copyWith(
      nombreTablero: nombreTablero,
      status: Formz.validate([nombreTablero, state.voltaje]),
    ));
  }

  void voltajeChanged(String value) {
    final voltaje = CampoNumber.dirty(value);
    emit(state.copyWith(
      voltaje: voltaje,
      status: Formz.validate([state.nombreTablero, voltaje]),
    ));
  }

  void submit() {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      // Aquí iría la lógica para enviar el formulario
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
