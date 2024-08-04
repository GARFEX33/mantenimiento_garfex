import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mantenimiento_garfex/blocs/formulario_tableros/formulario_tableros_bloc.dart';
import 'package:mantenimiento_garfex/models/mantenimiento_tablero.dart';
import 'package:mantenimiento_garfex/widgets/custom_button.dart';
import 'package:mantenimiento_garfex/widgets/loading_indicator.dart';

class TableroFormScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

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
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Formulario enviado con éxito')));
            Navigator.of(context).pop();
          } else if (state is FormularioTablerosError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
          }
        },
        child: BlocBuilder<FormularioTablerosBloc, FormularioTablerosState>(
          builder: (context, state) {
            if (state is FormularioTablerosCargando) {
              return LoadingIndicator();
            }
            if (state is FormularioTablerosUpdated) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Text(
                        'Datos del Servicio y Tablero',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 16.0),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: 'Mantenimiento'),
                        items: state.mantenimientos
                            .map((mantenimiento) => DropdownMenuItem(
                                  value: mantenimiento,
                                  child: Text(mantenimiento),
                                ))
                            .toList(),
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateMantenimiento(value!));
                        },
                        validator: (value) => value == null ? 'Este campo es obligatorio' : null,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Tablero'),
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateTablero(value));
                        },
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                      Divider(height: 32.0),
                      Text(
                        'Tablero Check List',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 16.0),
                      CheckboxListTile(
                        title: Text('Fases y neutro identificados'),
                        value: state.fasesYNeutroIdentificados,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateFasesYNeutroIdentificados(value!));
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Conductores peinados'),
                        value: state.conductoresPeinados,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateConductoresPeinados(value!));
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Protecciones de acuerdo al calibre del conductor'),
                        value: state.proteccionesDeAcuerdoAlCalibre,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateProteccionesDeAcuerdoAlCalibre(value!));
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Directorio de circuitos'),
                        value: state.directorioDeCircuitos,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateDirectorioDeCircuitos(value!));
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Tablero con barra de tierras'),
                        value: state.tableroConBarraDeTierras,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateTableroConBarraDeTierras(value!));
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Tablero con barra de neutros'),
                        value: state.tableroConBarraDeNeutros,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateTableroConBarraDeNeutros(value!));
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Tablero aterrizado'),
                        value: state.tableroAterrizado,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateTableroAterrizado(value!));
                        },
                      ),
                      Divider(height: 32.0),
                      Text(
                        'Voltaje',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'AB'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateAb(double.tryParse(value) ?? 0.0));
                        },
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'AC'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateAc(double.tryParse(value) ?? 0.0));
                        },
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'BC'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateBc(double.tryParse(value) ?? 0.0));
                        },
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                      Divider(height: 32.0),
                      Text(
                        'Corrientes',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'A'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateA(double.tryParse(value) ?? 0.0));
                        },
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'B'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateB(double.tryParse(value) ?? 0.0));
                        },
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'C'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateC(double.tryParse(value) ?? 0.0));
                        },
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Neutro'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateNeutro(double.tryParse(value) ?? 0.0));
                        },
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Tierra física'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateTierraFisica(double.tryParse(value) ?? 0.0));
                        },
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                      Divider(height: 32.0),
                      Text(
                        'Fotografías',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 16.0),
                      ListTile(
                        title: Text('Foto Antes'),
                        trailing: IconButton(
                          icon: Icon(Icons.photo),
                          onPressed: () => _pickImage(context, true),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ListTile(
                        title: Text('Foto Después'),
                        trailing: IconButton(
                          icon: Icon(Icons.photo),
                          onPressed: () => _pickImage(context, false),
                        ),
                      ),
                      Divider(height: 32.0),
                      Text(
                        'Termografía',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Termo Antes'),
                        maxLength: 15,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateTermoAntes(value));
                        },
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Termo Después'),
                        maxLength: 15,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateTermoDespues(value));
                        },
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Observaciones'),
                        maxLines: 3,
                        onChanged: (value) {
                          context.read<FormularioTablerosBloc>().add(UpdateObservaciones(value));
                        },
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                      SizedBox(height: 32.0),
                      CustomButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final stateUpdated = state;
                            final mantenimientoTablero = MantenimientoTablero(
                              mantenimiento: stateUpdated.mantenimiento,
                              tablero: stateUpdated.tablero,
                              fecha: stateUpdated.fecha,
                              fasesYNeutroIdentificados: stateUpdated.fasesYNeutroIdentificados,
                              conductoresPeinados: stateUpdated.conductoresPeinados,
                              proteccionesDeAcuerdoAlCalibre: stateUpdated.proteccionesDeAcuerdoAlCalibre,
                              directorioDeCircuitos: stateUpdated.directorioDeCircuitos,
                              tableroConBarraDeTierras: stateUpdated.tableroConBarraDeTierras,
                              tableroConBarraDeNeutros: stateUpdated.tableroConBarraDeNeutros,
                              tableroAterrizado: stateUpdated.tableroAterrizado,
                              ab: stateUpdated.ab,
                              ac: stateUpdated.ac,
                              bc: stateUpdated.bc,
                              a: stateUpdated.a,
                              b: stateUpdated.b,
                              c: stateUpdated.c,
                              neutro: stateUpdated.neutro,
                              tierraFisica: stateUpdated.tierraFisica,
                              fotoAntes: stateUpdated.fotoAntes,
                              fotoDespues: stateUpdated.fotoDespues,
                              termoAntes: stateUpdated.termoAntes,
                              termoDespues: stateUpdated.termoDespues,
                              observaciones: stateUpdated.observaciones,
                            );
                            context.read<FormularioTablerosBloc>().add(EnviarFormulario(mantenimientoTablero: mantenimientoTablero));
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
}
