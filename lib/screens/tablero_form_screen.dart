import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantenimiento_garfex/blocs/formulario_tablero/tablero_form_cubit.dart';
import 'package:mantenimiento_garfex/inputs/inputs.dart'; // Asegúrate de importar los inputs
import 'package:mantenimiento_garfex/widgets/widgets.dart'; // Asegúrate de importar los widgets

class TableroFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario Tableros'),
      ),
      body: BlocProvider(
        create: (context) => TableroFormCubit(),
        child: const _TableroFormView(),
      ),
    );
  }
}

class _TableroFormView extends StatelessWidget {
  const _TableroFormView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Form(
          child: ListView(
            children: [
              SectionTitle(title: 'Datos del Servicio y Tablero'),
              
              // DropdownField
              BlocBuilder<TableroFormCubit, TableroFormState>(
                builder: (context, state) {
                  return DropdownField(
                    labelText: 'Mantenimiento',
                    items: ['Opción 1', 'Opción 2', 'Opción 3'], // Actualiza con tus opciones
                    onChanged: (value) {
                      context.read<TableroFormCubit>().dropdownChanged(value);
                    },
                    errorMessage: state.dropdownInput.errorMessage,
                  );
                },
              ),
              SizedBox(height: 8.0),
              
              // Campo Nombre Tablero
              BlocBuilder<TableroFormCubit, TableroFormState>(
                builder: (context, state) {
                  return CustomTextFormField(
                    label: 'Tablero',
                    onChanged: (value) {
                      context.read<TableroFormCubit>().campoNombreTableroChanged(value);
                    },
                    errorMessage: state.campoNombreTablero.errorMessage,
                  );
                },
              ),
              SizedBox(height: 16.0),
              
              // Botón Enviar
              BlocBuilder<TableroFormCubit, TableroFormState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<TableroFormCubit>().onSubmit();
                    },
                    child: Text('Enviar'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
