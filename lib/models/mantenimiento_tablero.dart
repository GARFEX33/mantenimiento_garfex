class MantenimientoTablero {
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
  final double an; // Agregado
  final double bn; // Agregado
  final double cn; // Agregado
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

  MantenimientoTablero({
    required this.mantenimiento,
    required this.tablero,
    required this.fecha,
    required this.fasesYNeutroIdentificados,
    required this.conductoresPeinados,
    required this.proteccionesDeAcuerdoAlCalibre,
    required this.directorioDeCircuitos,
    required this.tableroConBarraDeTierras,
    required this.tableroConBarraDeNeutros,
    required this.tableroAterrizado,
    required this.ab,
    required this.ac,
    required this.bc,
    required this.an, // Agregado
    required this.bn, // Agregado
    required this.cn, // Agregado
    required this.a,
    required this.b,
    required this.c,
    required this.neutro,
    required this.tierraFisica,
    required this.fotoAntes,
    required this.fotoDespues,
    required this.termoAntes,
    required this.termoDespues,
    required this.observaciones,
  });

  Map<String, dynamic> toJson() {
    return {
      'mantenimiento': mantenimiento,
      'tablero': tablero,
      'fecha': fecha.toIso8601String(),
      'fasesYNeutroIdentificados': fasesYNeutroIdentificados,
      'conductoresPeinados': conductoresPeinados,
      'proteccionesDeAcuerdoAlCalibre': proteccionesDeAcuerdoAlCalibre,
      'directorioDeCircuitos': directorioDeCircuitos,
      'tableroConBarraDeTierras': tableroConBarraDeTierras,
      'tableroConBarraDeNeutros': tableroConBarraDeNeutros,
      'tableroAterrizado': tableroAterrizado,
      'ab': ab,
      'ac': ac,
      'bc': bc,
      'an': an, // Agregado
      'bn': bn, // Agregado
      'cn': cn, // Agregado
      'a': a,
      'b': b,
      'c': c,
      'neutro': neutro,
      'tierraFisica': tierraFisica,
      'fotoAntes': fotoAntes,
      'fotoDespues': fotoDespues,
      'termoAntes': termoAntes,
      'termoDespues': termoDespues,
      'observaciones': observaciones,
    };
  }

  static MantenimientoTablero fromJson(Map<String, dynamic> json) {
    return MantenimientoTablero(
      mantenimiento: json['mantenimiento'],
      tablero: json['tablero'],
      fecha: DateTime.parse(json['fecha']),
      fasesYNeutroIdentificados: json['fasesYNeutroIdentificados'],
      conductoresPeinados: json['conductoresPeinados'],
      proteccionesDeAcuerdoAlCalibre: json['proteccionesDeAcuerdoAlCalibre'],
      directorioDeCircuitos: json['directorioDeCircuitos'],
      tableroConBarraDeTierras: json['tableroConBarraDeTierras'],
      tableroConBarraDeNeutros: json['tableroConBarraDeNeutros'],
      tableroAterrizado: json['tableroAterrizado'],
      ab: json['ab'],
      ac: json['ac'],
      bc: json['bc'],
      an: json['an'], // Agregado
      bn: json['bn'], // Agregado
      cn: json['cn'], // Agregado
      a: json['a'],
      b: json['b'],
      c: json['c'],
      neutro: json['neutro'],
      tierraFisica: json['tierraFisica'],
      fotoAntes: json['fotoAntes'],
      fotoDespues: json['fotoDespues'],
      termoAntes: json['termoAntes'],
      termoDespues: json['termoDespues'],
      observaciones: json['observaciones'],
    );
  }
}
