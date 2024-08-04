part of 'formulario_tableros_bloc.dart';

@immutable
abstract class FormularioTablerosEvent extends Equatable {
  const FormularioTablerosEvent();

  @override
  List<Object> get props => [];
}

class EnviarFormulario extends FormularioTablerosEvent {
  final MantenimientoTablero mantenimientoTablero;

  const EnviarFormulario({required this.mantenimientoTablero});

  @override
  List<Object> get props => [mantenimientoTablero];
}

class CargarMantenimientos extends FormularioTablerosEvent {}

class ResetFormulario extends FormularioTablerosEvent {}

class UpdateMantenimiento extends FormularioTablerosEvent {
  final String mantenimiento;

  const UpdateMantenimiento(this.mantenimiento);

  @override
  List<Object> get props => [mantenimiento];
}

class UpdateTablero extends FormularioTablerosEvent {
  final String tablero;

  const UpdateTablero(this.tablero);

  @override
  List<Object> get props => [tablero];
}

class UpdateFasesYNeutroIdentificados extends FormularioTablerosEvent {
  final bool value;

  const UpdateFasesYNeutroIdentificados(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateConductoresPeinados extends FormularioTablerosEvent {
  final bool value;

  const UpdateConductoresPeinados(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateProteccionesDeAcuerdoAlCalibre extends FormularioTablerosEvent {
  final bool value;

  const UpdateProteccionesDeAcuerdoAlCalibre(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateDirectorioDeCircuitos extends FormularioTablerosEvent {
  final bool value;

  const UpdateDirectorioDeCircuitos(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateTableroConBarraDeTierras extends FormularioTablerosEvent {
  final bool value;

  const UpdateTableroConBarraDeTierras(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateTableroConBarraDeNeutros extends FormularioTablerosEvent {
  final bool value;

  const UpdateTableroConBarraDeNeutros(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateTableroAterrizado extends FormularioTablerosEvent {
  final bool value;

  const UpdateTableroAterrizado(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateAb extends FormularioTablerosEvent {
  final double value;

  const UpdateAb(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateAc extends FormularioTablerosEvent {
  final double value;

  const UpdateAc(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateBc extends FormularioTablerosEvent {
  final double value;

  const UpdateBc(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateA extends FormularioTablerosEvent {
  final double value;

  const UpdateA(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateB extends FormularioTablerosEvent {
  final double value;

  const UpdateB(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateC extends FormularioTablerosEvent {
  final double value;

  const UpdateC(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateNeutro extends FormularioTablerosEvent {
  final double value;

  const UpdateNeutro(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateTierraFisica extends FormularioTablerosEvent {
  final double value;

  const UpdateTierraFisica(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateFotoAntes extends FormularioTablerosEvent {
  final List<int> value;

  const UpdateFotoAntes(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateFotoDespues extends FormularioTablerosEvent {
  final List<int> value;

  const UpdateFotoDespues(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateTermoAntes extends FormularioTablerosEvent {
  final String value;

  const UpdateTermoAntes(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateTermoDespues extends FormularioTablerosEvent {
  final String value;

  const UpdateTermoDespues(this.value);

  @override
  List<Object> get props => [value];
}

class UpdateObservaciones extends FormularioTablerosEvent {
  final String value;

  const UpdateObservaciones(this.value);

  @override
  List<Object> get props => [value];
}
