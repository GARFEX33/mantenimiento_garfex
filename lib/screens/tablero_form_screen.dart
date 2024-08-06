import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantenimiento_garfex/blocs/formulario_tablero/formulario_cubit.dart';
import '../widgets/custom_text_form_field.dart';

class TableroFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormularioCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text('Formulario de Tablero')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormularioForm(),
        ),
      ),
    );
  }
}

class FormularioForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormularioCubit, FormularioState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de Tablero',
              onChanged: context.read<FormularioCubit>().tableroNameChanged,
              errorMessage: state.tableroName.errorMessage,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Voltaje',
              onChanged: context.read<FormularioCubit>().voltageChanged,
              errorMessage: state.voltage.errorMessage,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<FormularioCubit>().onSubmit();
              },
              child: Text('Enviar'),
            ),
          ],
        );
      },
    );
  }
}
