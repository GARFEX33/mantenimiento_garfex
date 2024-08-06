import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mantenimiento_garfex/models/mantenimiento_tablero.dart';

part 'mantenimiento_tablero_notifier.freezed.dart';

@freezed
class MantenimientoTableroState with _$MantenimientoTableroState {
  const factory MantenimientoTableroState({
    required MantenimientoTablero mantenimientoTablero,
  }) = _MantenimientoTableroState;
}

class MantenimientoTableroNotifier extends StateNotifier<MantenimientoTableroState> {
  MantenimientoTableroNotifier()
      : super(MantenimientoTableroState(
          mantenimientoTablero: MantenimientoTablero(
            mantenimiento: '',
            tablero: '',
            fecha: DateTime.now(),
            fasesYNeutroIdentificados: false,
            conductoresPeinados: false,
            proteccionesDeAcuerdoAlCalibre: false,
            directorioDeCircuitos: false,
            tableroConBarraDeTierras: false,
            tableroConBarraDeNeutros: false,
            tableroAterrizado: false,
            ab: 0.0,
            ac: 0.0,
            bc: 0.0,
            an: 0.0,
            bn: 0.0,
            cn: 0.0,
            a: 0.0,
            b: 0.0,
            c: 0.0,
            neutro: 0.0,
            tierraFisica: 0.0,
            fotoAntes: '',
            fotoDespues: '',
            termoAntes: '',
            termoDespues: '',
            observaciones: '',
          ),
        ));

  void saveMantenimientoTablero(MantenimientoTablero newMantenimientoTablero) {
    state = state.copyWith(mantenimientoTablero: newMantenimientoTablero);
    print(newMantenimientoTablero);  // Imprimir los valores en la consola
  }

  void clearForm() {
    state = MantenimientoTableroState(
      mantenimientoTablero: MantenimientoTablero(
        mantenimiento: '',
        tablero: '',
        fecha: DateTime.now(),
        fasesYNeutroIdentificados: false,
        conductoresPeinados: false,
        proteccionesDeAcuerdoAlCalibre: false,
        directorioDeCircuitos: false,
        tableroConBarraDeTierras: false,
        tableroConBarraDeNeutros: false,
        tableroAterrizado: false,
        ab: 0.0,
        ac: 0.0,
        bc: 0.0,
        an: 0.0,
        bn: 0.0,
        cn: 0.0,
        a: 0.0,
        b: 0.0,
        c: 0.0,
        neutro: 0.0,
        tierraFisica: 0.0,
        fotoAntes: '',
        fotoDespues: '',
        termoAntes: '',
        termoDespues: '',
        observaciones: '',
      ),
    );
  }
}
