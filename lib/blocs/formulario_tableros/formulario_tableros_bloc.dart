import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'formulario_tableros_event.dart';
part 'formulario_tableros_state.dart';

class FormularioTablerosBloc
    extends Bloc<FormularioTablerosEvent, FormularioTablerosState> {
  FormularioTablerosBloc() : super(FormularioTablerosInitial()) {
    on<ResetFormulario>(_onResetFormulario);
    on<UpdateFecha>(_onUpdateFecha);
    on<UpdateFotoAntes>(_onUpdateFotoAntes);
    on<UpdateFotoDespues>(_onUpdateFotoDespues);
    on<UpdateTablero>(_onUpdateTablero);
    on<UpdateMantenimiento>(_onUpdateMantenimiento);
    on<UpdateFasesYNeutroIdentificados>(_onUpdateFasesYNeutroIdentificados);
    on<UpdateConductoresPeinados>(_onUpdateConductoresPeinados);
    on<UpdateProteccionesDeAcuerdoAlCalibre>(
        _onUpdateProteccionesDeAcuerdoAlCalibre);
    on<UpdateDirectorioDeCircuitos>(_onUpdateDirectorioDeCircuitos);
    on<UpdateTableroConBarraDeTierras>(_onUpdateTableroConBarraDeTierras);
    on<UpdateTableroConBarraDeNeutros>(_onUpdateTableroConBarraDeNeutros);
    on<UpdateTableroAterrizado>(_onUpdateTableroAterrizado);
    on<UpdateAb>(_onUpdateAb);
    on<UpdateBc>(_onUpdateBc);
    on<UpdateAc>(_onUpdateAc);
    on<UpdateAn>(_onUpdateAn);
    on<UpdateBn>(_onUpdateBn);
    on<UpdateCn>(_onUpdateCn);
    on<UpdateA>(_onUpdateA);
    on<UpdateB>(_onUpdateB);
    on<UpdateC>(_onUpdateC);
    on<UpdateNeutro>(_onUpdateNeutro);
    on<UpdateTierraFisica>(_onUpdateTierraFisica);
    on<UpdateTermoAntes>(_onUpdateTermoAntes);
    on<UpdateTermoDespues>(_onUpdateTermoDespues);
    on<UpdateObservaciones>(_onUpdateObservaciones);
    on<EnviarFormulario>(_onEnviarFormulario);
  }

  void _onResetFormulario(
      ResetFormulario event, Emitter<FormularioTablerosState> emit) {
    emit(FormularioTablerosInitial());
  }

  void _onUpdateFecha(
      UpdateFecha event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(fecha: event.fecha));
    } else {
      emit(FormularioTablerosUpdated(fecha: event.fecha));
    }
  }

  void _onUpdateFotoAntes(
      UpdateFotoAntes event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(fotoAntes: event.fotoAntes));
    } else {
      emit(FormularioTablerosUpdated(
          fecha: DateTime.now(), fotoAntes: event.fotoAntes));
    }
  }

  void _onUpdateFotoDespues(
      UpdateFotoDespues event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(fotoDespues: event.fotoDespues));
    } else {
      emit(FormularioTablerosUpdated(
          fecha: DateTime.now(), fotoDespues: event.fotoDespues));
    }
  }

  void _onUpdateTablero(
      UpdateTablero event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(tablero: event.tablero));
    } else {
      emit(FormularioTablerosUpdated(
          fecha: DateTime.now(), tablero: event.tablero));
    }
  }

  void _onUpdateMantenimiento(
      UpdateMantenimiento event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(mantenimiento: event.mantenimiento));
    } else {
      emit(FormularioTablerosUpdated(
          fecha: DateTime.now(), mantenimiento: event.mantenimiento));
    }
  }

  void _onUpdateFasesYNeutroIdentificados(UpdateFasesYNeutroIdentificados event,
      Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(fasesYNeutroIdentificados: event.value));
    }
  }

  void _onUpdateConductoresPeinados(
      UpdateConductoresPeinados event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(conductoresPeinados: event.value));
    }
  }

  void _onUpdateProteccionesDeAcuerdoAlCalibre(
      UpdateProteccionesDeAcuerdoAlCalibre event,
      Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(proteccionesDeAcuerdoAlCalibre: event.value));
    }
  }

  void _onUpdateDirectorioDeCircuitos(UpdateDirectorioDeCircuitos event,
      Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(directorioDeCircuitos: event.value));
    }
  }

  void _onUpdateTableroConBarraDeTierras(UpdateTableroConBarraDeTierras event,
      Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(tableroConBarraDeTierras: event.value));
    }
  }

  void _onUpdateTableroConBarraDeNeutros(UpdateTableroConBarraDeNeutros event,
      Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(tableroConBarraDeNeutros: event.value));
    }
  }

  void _onUpdateTableroAterrizado(
      UpdateTableroAterrizado event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(tableroAterrizado: event.value));
    }
  }

  void _onUpdateAb(UpdateAb event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(ab: event.value));
    }
  }

  void _onUpdateBc(UpdateBc event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(bc: event.value));
    }
  }

  void _onUpdateAc(UpdateAc event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(ac: event.value));
    }
  }

  void _onUpdateAn(UpdateAn event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(an: event.value));
    }
  }

  void _onUpdateBn(UpdateBn event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(bn: event.value));
    }
  }

  void _onUpdateCn(UpdateCn event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(cn: event.value));
    }
  }

  void _onUpdateA(UpdateA event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(a: event.value));
    }
  }

  void _onUpdateB(UpdateB event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(b: event.value));
    }
  }

  void _onUpdateC(UpdateC event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(c: event.value));
    }
  }

  void _onUpdateNeutro(
      UpdateNeutro event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(neutro: event.value));
    }
  }

  void _onUpdateTierraFisica(
      UpdateTierraFisica event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(tierraFisica: event.value));
    }
  }

  void _onUpdateTermoAntes(
      UpdateTermoAntes event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(termoAntes: event.value));
    }
  }

  void _onUpdateTermoDespues(
      UpdateTermoDespues event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(termoDespues: event.value));
    }
  }

  void _onUpdateObservaciones(
      UpdateObservaciones event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(observaciones: event.value));
    }
  }

  void _onEnviarFormulario(
      EnviarFormulario event, Emitter<FormularioTablerosState> emit) async {
    emit(FormularioTablerosCargando());
    try {
      // Aquí deberías hacer la lógica de enviar el formulario
      await Future.delayed(Duration(seconds: 2)); // Simula un retraso
      emit(FormularioTablerosExito());
    } catch (error) {
      emit(FormularioTablerosError(error.toString()));
    }
  }
}
