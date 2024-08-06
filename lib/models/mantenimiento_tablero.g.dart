// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mantenimiento_tablero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MantenimientoTableroImpl _$$MantenimientoTableroImplFromJson(
        Map<String, dynamic> json) =>
    _$MantenimientoTableroImpl(
      mantenimiento: json['mantenimiento'] as String,
      tablero: json['tablero'] as String,
      fecha: DateTime.parse(json['fecha'] as String),
      fasesYNeutroIdentificados: json['fasesYNeutroIdentificados'] as bool,
      conductoresPeinados: json['conductoresPeinados'] as bool,
      proteccionesDeAcuerdoAlCalibre:
          json['proteccionesDeAcuerdoAlCalibre'] as bool,
      directorioDeCircuitos: json['directorioDeCircuitos'] as bool,
      tableroConBarraDeTierras: json['tableroConBarraDeTierras'] as bool,
      tableroConBarraDeNeutros: json['tableroConBarraDeNeutros'] as bool,
      tableroAterrizado: json['tableroAterrizado'] as bool,
      ab: (json['ab'] as num).toDouble(),
      ac: (json['ac'] as num).toDouble(),
      bc: (json['bc'] as num).toDouble(),
      an: (json['an'] as num).toDouble(),
      bn: (json['bn'] as num).toDouble(),
      cn: (json['cn'] as num).toDouble(),
      a: (json['a'] as num).toDouble(),
      b: (json['b'] as num).toDouble(),
      c: (json['c'] as num).toDouble(),
      neutro: (json['neutro'] as num).toDouble(),
      tierraFisica: (json['tierraFisica'] as num).toDouble(),
      fotoAntes: json['fotoAntes'] as String,
      fotoDespues: json['fotoDespues'] as String,
      termoAntes: json['termoAntes'] as String,
      termoDespues: json['termoDespues'] as String,
      observaciones: json['observaciones'] as String,
    );

Map<String, dynamic> _$$MantenimientoTableroImplToJson(
        _$MantenimientoTableroImpl instance) =>
    <String, dynamic>{
      'mantenimiento': instance.mantenimiento,
      'tablero': instance.tablero,
      'fecha': instance.fecha.toIso8601String(),
      'fasesYNeutroIdentificados': instance.fasesYNeutroIdentificados,
      'conductoresPeinados': instance.conductoresPeinados,
      'proteccionesDeAcuerdoAlCalibre': instance.proteccionesDeAcuerdoAlCalibre,
      'directorioDeCircuitos': instance.directorioDeCircuitos,
      'tableroConBarraDeTierras': instance.tableroConBarraDeTierras,
      'tableroConBarraDeNeutros': instance.tableroConBarraDeNeutros,
      'tableroAterrizado': instance.tableroAterrizado,
      'ab': instance.ab,
      'ac': instance.ac,
      'bc': instance.bc,
      'an': instance.an,
      'bn': instance.bn,
      'cn': instance.cn,
      'a': instance.a,
      'b': instance.b,
      'c': instance.c,
      'neutro': instance.neutro,
      'tierraFisica': instance.tierraFisica,
      'fotoAntes': instance.fotoAntes,
      'fotoDespues': instance.fotoDespues,
      'termoAntes': instance.termoAntes,
      'termoDespues': instance.termoDespues,
      'observaciones': instance.observaciones,
    };
