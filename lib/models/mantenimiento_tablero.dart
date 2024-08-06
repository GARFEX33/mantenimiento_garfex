import 'package:freezed_annotation/freezed_annotation.dart';

part 'mantenimiento_tablero.freezed.dart';
part 'mantenimiento_tablero.g.dart';

@freezed
class MantenimientoTablero with _$MantenimientoTablero {
  const factory MantenimientoTablero({
    required String mantenimiento,
    required String tablero,
    required DateTime fecha,
    required bool fasesYNeutroIdentificados,
    required bool conductoresPeinados,
    required bool proteccionesDeAcuerdoAlCalibre,
    required bool directorioDeCircuitos,
    required bool tableroConBarraDeTierras,
    required bool tableroConBarraDeNeutros,
    required bool tableroAterrizado,
    required double ab,
    required double ac,
    required double bc,
    required double an,
    required double bn,
    required double cn,
    required double a,
    required double b,
    required double c,
    required double neutro,
    required double tierraFisica,
    required String fotoAntes,
    required String fotoDespues,
    required String termoAntes,
    required String termoDespues,
    required String observaciones,
  }) = _MantenimientoTablero;

  factory MantenimientoTablero.fromJson(Map<String, dynamic> json) => _$MantenimientoTableroFromJson(json);
}
