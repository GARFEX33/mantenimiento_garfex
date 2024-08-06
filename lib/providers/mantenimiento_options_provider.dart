import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mantenimiento_options_provider.g.dart';

@riverpod
List<String> mantenimientoOptions(MantenimientoOptionsRef ref) {
  return ['Opción a', 'Opción 2', 'Opción 3'];
}
