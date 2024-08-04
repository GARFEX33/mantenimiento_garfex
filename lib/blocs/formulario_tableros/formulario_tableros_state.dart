part of 'formulario_tableros_bloc.dart';

@immutable
abstract class FormularioTablerosState extends Equatable {
  const FormularioTablerosState();

  @override
  List<Object> get props => [];
}

class FormularioTablerosInitial extends FormularioTablerosState {}

class FormularioTablerosCargando extends FormularioTablerosState {}

class FormularioTablerosUpdated extends FormularioTablerosState {
  final List<String> mantenimientos;
  final String mantenimiento;
  final String tablero;
  final DateTime fecha;
  final bool fasesYNeutroIdentificados;
  final bool conductoresPeinados;
  final bool proteccionesDeAcuerdoAlCalibre;
  final bool directorioDeCircuitos;
  final bool tableroConBarraDeTierras;
  final bool tableroConBarraDeNeutros;
  final bool tableroAterrizado;
  final double ab;
  final double ac;
  final double bc;
  final double an;
  final double bn;
  final double cn;
  final double a;
  final double b;
  final double c;
  final double neutro;
  final double tierraFisica;
  final String fotoAntes;
  final String fotoDespues;
  final String termoAntes;
  final String termoDespues;
  final String observaciones;

  FormularioTablerosUpdated({
    this.mantenimientos = const [],
    this.mantenimiento = '',
    this.tablero = '',
    DateTime? fecha,
    this.fasesYNeutroIdentificados = false,
    this.conductoresPeinados = false,
    this.proteccionesDeAcuerdoAlCalibre = false,
    this.directorioDeCircuitos = false,
    this.tableroConBarraDeTierras = false,
    this.tableroConBarraDeNeutros = false,
    this.tableroAterrizado = false,
    this.ab = 0.0,
    this.ac = 0.0,
    this.bc = 0.0,
    this.an = 0.0,
    this.bn = 0.0,
    this.cn = 0.0,
    this.a = 0.0,
    this.b = 0.0,
    this.c = 0.0,
    this.neutro = 0.0,
    this.tierraFisica = 0.0,
    this.fotoAntes = '',
    this.fotoDespues = '',
    this.termoAntes = '',
    this.termoDespues = '',
    this.observaciones = '',
  }) : fecha = fecha ?? DateTime.now();

  FormularioTablerosUpdated copyWith({
    List<String>? mantenimientos,
    String? mantenimiento,
    String? tablero,
    DateTime? fecha,
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
    String? fotoAntes,
    String? fotoDespues,
    String? termoAntes,
    String? termoDespues,
    String? observaciones,
  }) {
    return FormularioTablerosUpdated(
      mantenimientos: mantenimientos ?? this.mantenimientos,
      mantenimiento: mantenimiento ?? this.mantenimiento,
      tablero: tablero ?? this.tablero,
      fecha: fecha ?? this.fecha,
      fasesYNeutroIdentificados: fasesYNeutroIdentificados ?? this.fasesYNeutroIdentificados,
      conductoresPeinados: conductoresPeinados ?? this.conductoresPeinados,
      proteccionesDeAcuerdoAlCalibre: proteccionesDeAcuerdoAlCalibre ?? this.proteccionesDeAcuerdoAlCalibre,
      directorioDeCircuitos: directorioDeCircuitos ?? this.directorioDeCircuitos,
      tableroConBarraDeTierras: tableroConBarraDeTierras ?? this.tableroConBarraDeTierras,
      tableroConBarraDeNeutros: tableroConBarraDeNeutros ?? this.tableroConBarraDeNeutros,
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
      fotoAntes: fotoAntes ?? this.fotoAntes,
      fotoDespues: fotoDespues ?? this.fotoDespues,
      termoAntes: termoAntes ?? this.termoAntes,
      termoDespues: termoDespues ?? this.termoDespues,
      observaciones: observaciones ?? this.observaciones,
    );
  }

  @override
  List<Object> get props => [
        mantenimientos,
        mantenimiento,
        tablero,
        fecha,
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
        fotoAntes,
        fotoDespues,
        termoAntes,
        termoDespues,
        observaciones,
      ];
}

class FormularioTablerosExito extends FormularioTablerosState {}

class FormularioTablerosError extends FormularioTablerosState {
  final String error;

  FormularioTablerosError({required this.error});

  @override
  List<Object> get props => [error];
}
