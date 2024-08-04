import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mantenimiento_garfex/models/mantenimiento_tablero.dart';

part 'formulario_tableros_event.dart';
part 'formulario_tableros_state.dart';

class FormularioTablerosBloc extends Bloc<FormularioTablerosEvent, FormularioTablerosState> {
  FormularioTablerosBloc() : super(FormularioTablerosInitial()) {
    on<EnviarFormulario>(_onEnviarFormulario);
    on<CargarMantenimientos>(_onCargarMantenimientos);
    on<ResetFormulario>(_onResetFormulario);
    on<UpdateMantenimiento>(_onUpdateMantenimiento);
    on<UpdateTablero>(_onUpdateTablero);
    on<UpdateFecha>(_onUpdateFecha); // Added
    on<UpdateFasesYNeutroIdentificados>(_onUpdateFasesYNeutroIdentificados);
    on<UpdateConductoresPeinados>(_onUpdateConductoresPeinados);
    on<UpdateProteccionesDeAcuerdoAlCalibre>(_onUpdateProteccionesDeAcuerdoAlCalibre);
    on<UpdateDirectorioDeCircuitos>(_onUpdateDirectorioDeCircuitos);
    on<UpdateTableroConBarraDeTierras>(_onUpdateTableroConBarraDeTierras);
    on<UpdateTableroConBarraDeNeutros>(_onUpdateTableroConBarraDeNeutros);
    on<UpdateTableroAterrizado>(_onUpdateTableroAterrizado);
    on<UpdateAb>(_onUpdateAb);
    on<UpdateAc>(_onUpdateAc);
    on<UpdateBc>(_onUpdateBc);
    on<UpdateAn>(_onUpdateAn); // Added
    on<UpdateBn>(_onUpdateBn); // Added
    on<UpdateCn>(_onUpdateCn); // Added
    on<UpdateA>(_onUpdateA);
    on<UpdateB>(_onUpdateB);
    on<UpdateC>(_onUpdateC);
    on<UpdateNeutro>(_onUpdateNeutro);
    on<UpdateTierraFisica>(_onUpdateTierraFisica);
    on<UpdateFotoAntes>(_onUpdateFotoAntes);
    on<UpdateFotoDespues>(_onUpdateFotoDespues);
    on<UpdateTermoAntes>(_onUpdateTermoAntes);
    on<UpdateTermoDespues>(_onUpdateTermoDespues);
    on<UpdateObservaciones>(_onUpdateObservaciones);
  }

  void _onEnviarFormulario(EnviarFormulario event, Emitter<FormularioTablerosState> emit) async {
    emit(FormularioTablerosCargando());
    try {
      // Imprime los datos del formulario
      print('Enviando formulario: ${event.mantenimientoTablero.toJson()}');
      // Aquí iría tu código para enviar los datos a Supabase
      emit(FormularioTablerosExito());
    } catch (e) {
      emit(FormularioTablerosError(error: e.toString()));
    }
  }

  void _onCargarMantenimientos(CargarMantenimientos event, Emitter<FormularioTablerosState> emit) async {
    emit(FormularioTablerosCargando());
    try {
      // Lógica para cargar mantenimientos desde Supabase
      // Aquí iría tu código para obtener los datos desde Supabase
      // Usaremos una lista de ejemplo
      final mantenimientos = ['Mantenimiento 1', 'Mantenimiento 2', 'Mantenimiento 3'];
      emit(FormularioTablerosUpdated(
        mantenimientos: mantenimientos,
        fecha: DateTime.now(),
      ));
    } catch (e) {
      emit(FormularioTablerosError(error: e.toString()));
    }
  }

  void _onResetFormulario(ResetFormulario event, Emitter<FormularioTablerosState> emit) {
    emit(FormularioTablerosInitial());
    add(CargarMantenimientos());
  }

  void _onUpdateMantenimiento(UpdateMantenimiento event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(mantenimiento: event.mantenimiento));
    }
  }

  void _onUpdateTablero(UpdateTablero event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(tablero: event.tablero));
    }
  }

  void _onUpdateFecha(UpdateFecha event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(fecha: event.fecha));
    }
  }

  void _onUpdateFasesYNeutroIdentificados(UpdateFasesYNeutroIdentificados event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(fasesYNeutroIdentificados: event.value));
    }
  }

  void _onUpdateConductoresPeinados(UpdateConductoresPeinados event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(conductoresPeinados: event.value));
    }
  }

  void _onUpdateProteccionesDeAcuerdoAlCalibre(UpdateProteccionesDeAcuerdoAlCalibre event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(proteccionesDeAcuerdoAlCalibre: event.value));
    }
  }

  void _onUpdateDirectorioDeCircuitos(UpdateDirectorioDeCircuitos event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(directorioDeCircuitos: event.value));
    }
  }

  void _onUpdateTableroConBarraDeTierras(UpdateTableroConBarraDeTierras event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(tableroConBarraDeTierras: event.value));
    }
  }

  void _onUpdateTableroConBarraDeNeutros(UpdateTableroConBarraDeNeutros event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(tableroConBarraDeNeutros: event.value));
    }
  }

  void _onUpdateTableroAterrizado(UpdateTableroAterrizado event, Emitter<FormularioTablerosState> emit) {
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

  void _onUpdateAc(UpdateAc event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(ac: event.value));
    }
  }

  void _onUpdateBc(UpdateBc event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(bc: event.value));
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

  void _onUpdateNeutro(UpdateNeutro event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(neutro: event.value));
    }
  }

  void _onUpdateTierraFisica(UpdateTierraFisica event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(tierraFisica: event.value));
    }
  }

  void _onUpdateFotoAntes(UpdateFotoAntes event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(fotoAntes: base64Encode(event.value)));
    }
  }

  void _onUpdateFotoDespues(UpdateFotoDespues event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(fotoDespues: base64Encode(event.value)));
    }
  }

  void _onUpdateTermoAntes(UpdateTermoAntes event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(termoAntes: event.value));
    }
  }

  void _onUpdateTermoDespues(UpdateTermoDespues event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(termoDespues: event.value));
    }
  }

  void _onUpdateObservaciones(UpdateObservaciones event, Emitter<FormularioTablerosState> emit) {
    final currentState = state;
    if (currentState is FormularioTablerosUpdated) {
      emit(currentState.copyWith(observaciones: event.value));
    }
  }
}
