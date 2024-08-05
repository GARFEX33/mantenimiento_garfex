part of 'formulario_tableros_bloc.dart';

@immutable
abstract class FormularioTablerosState extends Equatable {
  const FormularioTablerosState();

  @override
  List<Object?> get props => [];
}

class FormularioTablerosInitial extends FormularioTablerosState {}

class FormularioTablerosCargando extends FormularioTablerosState {}

class FormularioTablerosUpdated extends FormularioTablerosState {
  final String? mantenimiento;
  final String? tablero;
  final DateTime fecha;
  final Uint8List? fotoAntes;
  final Uint8List? fotoDespues;
  final bool fasesYNeutroIdentificados;
  final bool conductoresPeinados;
  final bool proteccionesDeAcuerdoAlCalibre;
  final bool directorioDeCircuitos;
  final bool tableroConBarraDeTierras;
  final bool tableroConBarraDeNeutros;
  final bool tableroAterrizado;
  final double? ab;
  final double? ac;
  final double? bc;
  final double? an;
  final double? bn;
  final double? cn;
  final double? a;
  final double? b;
  final double? c;
  final double? neutro;
  final double? tierraFisica;
  final String? termoAntes;
  final String? termoDespues;
  final String? observaciones;
  final List<String> mantenimientos;

  const FormularioTablerosUpdated({
    this.mantenimiento,
    this.tablero,
    required this.fecha,
    this.fotoAntes,
    this.fotoDespues,
    this.fasesYNeutroIdentificados = false,
    this.conductoresPeinados = false,
    this.proteccionesDeAcuerdoAlCalibre = false,
    this.directorioDeCircuitos = false,
    this.tableroConBarraDeTierras = false,
    this.tableroConBarraDeNeutros = false,
    this.tableroAterrizado = false,
    this.ab,
    this.ac,
    this.bc,
    this.an,
    this.bn,
    this.cn,
    this.a,
    this.b,
    this.c,
    this.neutro,
    this.tierraFisica,
    this.termoAntes,
    this.termoDespues,
    this.observaciones,
    this.mantenimientos = const [],
  });

  FormularioTablerosUpdated copyWith({
    String? mantenimiento,
    String? tablero,
    DateTime? fecha,
    Uint8List? fotoAntes,
    Uint8List? fotoDespues,
    bool? fasesYNeutroIdentificados,
    bool? conductoresPeinados,
    bool? proteccionesDeAcuerdoAlCalibre,
    bool? directorioDeCircuitos,
    bool? tableroConBarraDeTierras,
    bool? tableroConBarraDeNeutros,
    bool? tableroAterrizado,
    double? ab,
    double? ac,
    double? bc,
    double? an,
    double? bn,
    double? cn,
    double? a,
    double? b,
    double? c,
    double? neutro,
    double? tierraFisica,
    String? termoAntes,
    String? termoDespues,
    String? observaciones,
    List<String>? mantenimientos,
  }) {
    return FormularioTablerosUpdated(
      mantenimiento: mantenimiento ?? this.mantenimiento,
      tablero: tablero ?? this.tablero,
      fecha: fecha ?? this.fecha,
      fotoAntes: fotoAntes ?? this.fotoAntes,
      fotoDespues: fotoDespues ?? this.fotoDespues,
      fasesYNeutroIdentificados:
          fasesYNeutroIdentificados ?? this.fasesYNeutroIdentificados,
      conductoresPeinados: conductoresPeinados ?? this.conductoresPeinados,
      proteccionesDeAcuerdoAlCalibre:
          proteccionesDeAcuerdoAlCalibre ?? this.proteccionesDeAcuerdoAlCalibre,
      directorioDeCircuitos:
          directorioDeCircuitos ?? this.directorioDeCircuitos,
      tableroConBarraDeTierras:
          tableroConBarraDeTierras ?? this.tableroConBarraDeTierras,
      tableroConBarraDeNeutros:
          tableroConBarraDeNeutros ?? this.tableroConBarraDeNeutros,
      tableroAterrizado: tableroAterrizado ?? this.tableroAterrizado,
      ab: ab ?? this.ab,
      ac: ac ?? this.ac,
      bc: bc ?? this.bc,
      an: an ?? this.an,
      bn: bn ?? this.bn,
      cn: cn ?? this.cn,
      a: a ?? this.a,
      b: b ?? this.b,
      c: c ?? this.c,
      neutro: neutro ?? this.neutro,
      tierraFisica: tierraFisica ?? this.tierraFisica,
      termoAntes: termoAntes ?? this.termoAntes,
      termoDespues: termoDespues ?? this.termoDespues,
      observaciones: observaciones ?? this.observaciones,
      mantenimientos: mantenimientos ?? this.mantenimientos,
    );
  }

  @override
  List<Object?> get props => [
        mantenimiento,
        tablero,
        fecha,
        fotoAntes,
        fotoDespues,
        fasesYNeutroIdentificados,
        conductoresPeinados,
        proteccionesDeAcuerdoAlCalibre,
        directorioDeCircuitos,
        tableroConBarraDeTierras,
        tableroConBarraDeNeutros,
        tableroAterrizado,
        ab,
        ac,
        bc,
        an,
        bn,
        cn,
        a,
        b,
        c,
        neutro,
        tierraFisica,
        termoAntes,
        termoDespues,
        observaciones,
        mantenimientos,
      ];
}
