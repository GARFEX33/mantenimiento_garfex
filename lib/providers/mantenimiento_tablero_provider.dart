
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mantenimiento_garfex/providers/notifiers/mantenimiento_tablero_notifier.dart';

final mantenimientoTableroProvider = StateNotifierProvider<MantenimientoTableroNotifier, MantenimientoTableroState>(
  (ref) => MantenimientoTableroNotifier(),
);

final tableroFieldProvider = StateProvider<String>((ref) => '');
final mantenimientoFieldProvider = StateProvider<String?>((ref) => null);
