part of 'formulario_tableros_bloc.dart';

@immutable
abstract class FormularioTablerosEvent {}

class EnviarFormulario extends FormularioTablerosEvent {
  final MantenimientoTablero mantenimientoTablero;

  EnviarFormulario({required this.mantenimientoTablero});
}

class CargarMantenimientos extends FormularioTablerosEvent {}

class ResetFormulario extends FormularioTablerosEvent {}

class UpdateMantenimiento extends FormularioTablerosEvent {
  final String mantenimiento;

  UpdateMantenimiento(this.mantenimiento);
}

class UpdateTablero extends FormularioTablerosEvent {
  final String tablero;

  UpdateTablero(this.tablero);
}

class UpdateFecha extends FormularioTablerosEvent {
  final DateTime fecha;

  UpdateFecha(this.fecha);
}

class UpdateFasesYNeutroIdentificados extends FormularioTablerosEvent {
  final bool value;

  UpdateFasesYNeutroIdentificados(this.value);
}

class UpdateConductoresPeinados extends FormularioTablerosEvent {
  final bool value;

  UpdateConductoresPeinados(this.value);
}

class UpdateProteccionesDeAcuerdoAlCalibre extends FormularioTablerosEvent {
  final bool value;

  UpdateProteccionesDeAcuerdoAlCalibre(this.value);
}

class UpdateDirectorioDeCircuitos extends FormularioTablerosEvent {
  final bool value;

  UpdateDirectorioDeCircuitos(this.value);
}

class UpdateTableroConBarraDeTierras extends FormularioTablerosEvent {
  final bool value;

  UpdateTableroConBarraDeTierras(this.value);
}

class UpdateTableroConBarraDeNeutros extends FormularioTablerosEvent {
  final bool value;

  UpdateTableroConBarraDeNeutros(this.value);
}

class UpdateTableroAterrizado extends FormularioTablerosEvent {
  final bool value;

  UpdateTableroAterrizado(this.value);
}

class UpdateAb extends FormularioTablerosEvent {
  final double value;

  UpdateAb(this.value);
}

class UpdateAc extends FormularioTablerosEvent {
  final double value;

  UpdateAc(this.value);
}

class UpdateBc extends FormularioTablerosEvent {
  final double value;

  UpdateBc(this.value);
}

class UpdateAn extends FormularioTablerosEvent {
  final double value;

  UpdateAn(this.value);
}

class UpdateBn extends FormularioTablerosEvent {
  final double value;

  UpdateBn(this.value);
}

class UpdateCn extends FormularioTablerosEvent {
  final double value;

  UpdateCn(this.value);
}

class UpdateA extends FormularioTablerosEvent {
  final double value;

  UpdateA(this.value);
}

class UpdateB extends FormularioTablerosEvent {
  final double value;

  UpdateB(this.value);
}

class UpdateC extends FormularioTablerosEvent {
  final double value;

  UpdateC(this.value);
}

class UpdateNeutro extends FormularioTablerosEvent {
  final double value;

  UpdateNeutro(this.value);
}

class UpdateTierraFisica extends FormularioTablerosEvent {
  final double value;

  UpdateTierraFisica(this.value);
}

class UpdateFotoAntes extends FormularioTablerosEvent {
  final List<int> value;

  UpdateFotoAntes(this.value);
}

class UpdateFotoDespues extends FormularioTablerosEvent {
  final List<int> value;

  UpdateFotoDespues(this.value);
}

class UpdateTermoAntes extends FormularioTablerosEvent {
  final String value;

  UpdateTermoAntes(this.value);
}

class UpdateTermoDespues extends FormularioTablerosEvent {
  final String value;

  UpdateTermoDespues(this.value);
}

class UpdateObservaciones extends FormularioTablerosEvent {
  final String value;

  UpdateObservaciones(this.value);
}
