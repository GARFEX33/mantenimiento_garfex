import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mantenimiento_garfex/blocs/formulario_tableros/formulario_tableros_bloc.dart';
import 'package:mantenimiento_garfex/models/mantenimiento_tablero.dart';
import 'package:mantenimiento_garfex/widgets/custom_button.dart';
import 'package:mantenimiento_garfex/widgets/loading_indicator.dart';

class TableroFormScreen extends StatefulWidget {
  @override
  _TableroFormScreenState createState() => _TableroFormScreenState();
}

class _TableroFormScreenState extends State<TableroFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  }

  Future<void> _pickImage(BuildContext context, bool isBefore) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      if (isBefore) {
        context.read<FormularioTablerosBloc>().add(UpdateFotoAntes(bytes));
      } else {
        context.read<FormularioTablerosBloc>().add(UpdateFotoDespues(bytes));
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
      context.read<FormularioTablerosBloc>().add(UpdateFecha(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<FormularioTablerosBloc>().add(ResetFormulario());

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario Tableros'),
      ),
      body: BlocListener<FormularioTablerosBloc, FormularioTablerosState>(
        listener: (context, state) {
          if (state is FormularioTablerosExito) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Formulario enviado con éxito')));
            Navigator.of(context).pop();
          } else if (state is FormularioTablerosError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
          }
        },
        child: BlocBuilder<FormularioTablerosBloc, FormularioTablerosState>(
          builder: (context, state) {
            if (state is FormularioTablerosCargando) {
              return LoadingIndicator();
            }
            if (state is FormularioTablerosUpdated) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      _buildSectionTitle(
                          context, 'Datos del Servicio y Tablero'),
                      _buildDropdownField(
                          context, state, 'Mantenimiento', state.mantenimientos,
                          (value) {
                        context
                            .read<FormularioTablerosBloc>()
                            .add(UpdateMantenimiento(value!));
                      }),
                      SizedBox(height: 8.0),
                      _buildTextField(context, 'Tablero', (value) {
                        context
                            .read<FormularioTablerosBloc>()
                            .add(UpdateTablero(value));
                      }),
                      SizedBox(height: 8.0),
                      _buildDateField(context, _dateController, _selectDate),
                      _buildDivider(),
                      _buildSectionTitle(context, 'Tablero Check List'),
                      _buildCompactCheckboxField(
                          context,
                          'Fases y neutro identificados',
                          state.fasesYNeutroIdentificados, (value) {
                        context
                            .read<FormularioTablerosBloc>()
                            .add(UpdateFasesYNeutroIdentificados(value!));
                      }),
                      _buildCompactCheckboxField(
                          context,
                          'Conductores peinados',
                          state.conductoresPeinados, (value) {
                        context
                            .read<FormularioTablerosBloc>()
                            .add(UpdateConductoresPeinados(value!));
                      }),
                      _buildCompactCheckboxField(
                          context,
                          'Protecciones de acuerdo al calibre del conductor',
                          state.proteccionesDeAcuerdoAlCalibre, (value) {
                        context
                            .read<FormularioTablerosBloc>()
                            .add(UpdateProteccionesDeAcuerdoAlCalibre(value!));
                      }),
                      _buildCompactCheckboxField(
                          context,
                          'Directorio de circuitos',
                          state.directorioDeCircuitos, (value) {
                        context
                            .read<FormularioTablerosBloc>()
                            .add(UpdateDirectorioDeCircuitos(value!));
                      }),
                      _buildCompactCheckboxField(
                          context,
                          'Tablero con barra de tierras',
                          state.tableroConBarraDeTierras, (value) {
                        context
                            .read<FormularioTablerosBloc>()
                            .add(UpdateTableroConBarraDeTierras(value!));
                      }),
                      _buildCompactCheckboxField(
                          context,
                          'Tablero con barra de neutros',
                          state.tableroConBarraDeNeutros, (value) {
                        context
                            .read<FormularioTablerosBloc>()
                            .add(UpdateTableroConBarraDeNeutros(value!));
                      }),
                      _buildCompactCheckboxField(context, 'Tablero aterrizado',
                          state.tableroAterrizado, (value) {
                        context
                            .read<FormularioTablerosBloc>()
                            .add(UpdateTableroAterrizado(value!));
                      }),
                      _buildDivider(),
                      _buildSectionTitle(context, 'Voltaje'),
                      _buildVoltageGrid(context, state),
                      _buildDivider(),
                      _buildSectionTitle(context, 'Corrientes'),
                      _buildCurrentGrid(context, state),
                      _buildDivider(),
                      _buildSectionTitle(context, 'Fotografías'),
                      _buildPhotoPicker(context, 'Foto Antes',
                          () => _pickImage(context, true)),
                      SizedBox(height: 8.0),
                      _buildPhotoPicker(context, 'Foto Después',
                          () => _pickImage(context, false)),
                      _buildDivider(),
                      _buildSectionTitle(context, 'Termografía'),
                      _buildTextField(context, 'Termo Antes', (value) {
                        context
                            .read<FormularioTablerosBloc>()
                            .add(UpdateTermoAntes(value));
                      }),
                      SizedBox(height: 8.0),
                      _buildTextField(context, 'Termo Después', (value) {
                        context
                            .read<FormularioTablerosBloc>()
                            .add(UpdateTermoDespues(value));
                      }),
                      SizedBox(height: 8.0),
                      _buildTextField(context, 'Observaciones', (value) {
                        context
                            .read<FormularioTablerosBloc>()
                            .add(UpdateObservaciones(value));
                      }, maxLines: 3),
                      SizedBox(height: 16.0),
                      CustomButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final stateUpdated = state;
                            final mantenimientoTablero = MantenimientoTablero(
                              mantenimiento: stateUpdated.mantenimiento ?? '',
                              tablero: stateUpdated.tablero ?? '',
                              fecha: stateUpdated.fecha,
                              fasesYNeutroIdentificados:
                                  stateUpdated.fasesYNeutroIdentificados,
                              conductoresPeinados:
                                  stateUpdated.conductoresPeinados,
                              proteccionesDeAcuerdoAlCalibre:
                                  stateUpdated.proteccionesDeAcuerdoAlCalibre,
                              directorioDeCircuitos:
                                  stateUpdated.directorioDeCircuitos,
                              tableroConBarraDeTierras:
                                  stateUpdated.tableroConBarraDeTierras,
                              tableroConBarraDeNeutros:
                                  stateUpdated.tableroConBarraDeNeutros,
                              tableroAterrizado: stateUpdated.tableroAterrizado,
                              ab: stateUpdated.ab!,
                              ac: stateUpdated.ac!,
                              bc: stateUpdated.bc!,
                              an: stateUpdated.an!,
                              bn: stateUpdated.bn!,
                              cn: stateUpdated.cn!,
                              a: stateUpdated.a!,
                              b: stateUpdated.b!,
                              c: stateUpdated.c!,
                              neutro: stateUpdated.neutro!,
                              tierraFisica: stateUpdated.tierraFisica!,
                              fotoAntes: stateUpdated.fotoAntes,
                              fotoDespues: stateUpdated.fotoDespues,
                              termoAntes: stateUpdated.termoAntes,
                              termoDespues: stateUpdated.termoDespues,
                              observaciones: stateUpdated.observaciones,
                            );
                            context.read<FormularioTablerosBloc>().add(
                                EnviarFormulario(
                                    mantenimientoTablero:
                                        mantenimientoTablero));
                          }
                        },
                        text: 'Enviar',
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container(); // Devolver un contenedor vacío si no se encuentra el estado
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildDropdownField(
      BuildContext context,
      FormularioTablerosUpdated state,
      String labelText,
      List<String> items,
      void Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: labelText),
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) =>
            value == null ? 'Este campo es obligatorio' : null,
      ),
    );
  }

  Widget _buildTextField(
      BuildContext context, String labelText, void Function(String) onChanged,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: labelText),
        keyboardType:
            labelText.contains('Voltaje') || labelText.contains('Corrientes')
                ? TextInputType.number
                : TextInputType.text,
        onChanged: onChanged,
        validator: (value) =>
            value!.isEmpty ? 'Este campo es obligatorio' : null,
        maxLines: maxLines,
      ),
    );
  }

  Widget _buildDateField(BuildContext context, TextEditingController controller,
      Future<void> Function(BuildContext) selectDate) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Fecha',
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => selectDate(context),
          ),
        ),
        readOnly: true,
      ),
    );
  }

  Widget _buildCompactCheckboxField(BuildContext context, String title,
      bool value, void Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: CheckboxListTile(
        title: Text(title, style: TextStyle(fontSize: 14.0)),
        value: value,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.trailing,
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
        dense: true,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 24.0);
  }

  Widget _buildPhotoPicker(
      BuildContext context, String title, void Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(title),
        trailing: IconButton(
          icon: Icon(Icons.photo),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget _buildVoltageGrid(
      BuildContext context, FormularioTablerosUpdated state) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: _buildTextField(context, 'AB', (value) {
              context
                  .read<FormularioTablerosBloc>()
                  .add(UpdateAb(double.tryParse(value) ?? 0.0));
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'BC', (value) {
              context
                  .read<FormularioTablerosBloc>()
                  .add(UpdateBc(double.tryParse(value) ?? 0.0));
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'AC', (value) {
              context
                  .read<FormularioTablerosBloc>()
                  .add(UpdateAc(double.tryParse(value) ?? 0.0));
            })),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
                child: _buildTextField(context, 'AN', (value) {
              context
                  .read<FormularioTablerosBloc>()
                  .add(UpdateAn(double.tryParse(value) ?? 0.0));
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'BN', (value) {
              context
                  .read<FormularioTablerosBloc>()
                  .add(UpdateBn(double.tryParse(value) ?? 0.0));
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'CN', (value) {
              context
                  .read<FormularioTablerosBloc>()
                  .add(UpdateCn(double.tryParse(value) ?? 0.0));
            })),
          ],
        ),
      ],
    );
  }

  Widget _buildCurrentGrid(
      BuildContext context, FormularioTablerosUpdated state) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: _buildTextField(context, 'A', (value) {
              context
                  .read<FormularioTablerosBloc>()
                  .add(UpdateA(double.tryParse(value) ?? 0.0));
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'B', (value) {
              context
                  .read<FormularioTablerosBloc>()
                  .add(UpdateB(double.tryParse(value) ?? 0.0));
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'C', (value) {
              context
                  .read<FormularioTablerosBloc>()
                  .add(UpdateC(double.tryParse(value) ?? 0.0));
            })),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
                child: _buildTextField(context, 'Neutro', (value) {
              context
                  .read<FormularioTablerosBloc>()
                  .add(UpdateNeutro(double.tryParse(value) ?? 0.0));
            })),
            SizedBox(width: 8.0),
            Expanded(
                child: _buildTextField(context, 'Tierra física', (value) {
              context
                  .read<FormularioTablerosBloc>()
                  .add(UpdateTierraFisica(double.tryParse(value) ?? 0.0));
            })),
          ],
        ),
      ],
    );
  }
}
