# Ejemplos de Código para Formularios en Flutter con BloC y Formz

Estos ejemplos de código deben ser implementados exactamente como se muestra, respetando la estructura y contenido de cada archivo. Asegúrate de seguir la estructura y detalles de los métodos, pero los nombres de archivos y clases deben ser los especificados.

## 1. Crear Inputs con Formz

Los inputs en Formz deben ubicarse en la carpeta `inputs`. Son componentes reutilizables diseñados para manejar entradas de formularios y no deben confundirse con modelos.

### Campo de Texto Reutilizable

**Archivo: `campo_str.dart`**

```dart
import 'package:formz/formz.dart';

// Enum para los posibles errores del campo de texto
enum CampoStrError { empty }

class CampoStr extends FormzInput<String, CampoStrError> {
  const CampoStr.pure() : super.pure('');
  const CampoStr.dirty(String value) : super.dirty(value);

  @override
  CampoStrError? validator(String value) {
    if (value.isEmpty) return CampoStrError.empty;
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == CampoStrError.empty) return 'Este campo es requerido';
    return null;
  }
}
```

### Campo de Número Reutilizable

**Archivo: `campo_number.dart`**

```dart
import 'package:formz/formz.dart';

// Enum para los posibles errores del campo de número
enum CampoNumberError { empty, invalid }

class CampoNumber extends FormzInput<String, CampoNumberError> {
  const CampoNumber.pure() : super.pure('');
  const CampoNumber.dirty(String value) : super.dirty(value);

  @override
  CampoNumberError? validator(String value) {
    if (value.isEmpty) return CampoNumberError.empty;
    if (double.tryParse(value) == null) return CampoNumberError.invalid;
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == CampoNumberError.empty) return 'Este campo es requerido';
    if (displayError == CampoNumberError.invalid) return 'Debe ser un número válido';
    return null;
  }
}
```

### Input de Correo Electrónico

**Archivo: `email_input.dart`**

```dart
import 'package:formz/formz.dart';

// Enum para los posibles errores del campo de correo electrónico
enum EmailError { empty, format }

class Email extends FormzInput<String, EmailError> {
  const Email.pure() : super.pure('');
  const Email.dirty(String value) : super.dirty(value);

  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  EmailError? validator(String value) {
    if (value.isEmpty) return EmailError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailError.format;
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return 'El campo es requerido';
    if (displayError == EmailError.format) return 'No tiene formato de correo electrónico';
    return null;
  }
}
```

### Input de Contraseña

**Archivo: `password_input.dart`**

```dart
import 'package:formz/formz.dart';

// Enum para los posibles errores del campo de contraseña
enum PasswordError { empty, short }

class Password extends FormzInput<String, PasswordError> {
  const Password.pure() : super.pure('');
  const Password.dirty(String value) : super.dirty(value);

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty) return PasswordError.empty;
    if (value.length < 6) return PasswordError.short;
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordError.empty) return 'El campo es requerido';
    if (displayError == PasswordError.short) return 'La contraseña debe tener al menos 6 caracteres';
    return null;
  }
}
```

### Input de Nombre de Usuario

**Archivo: `username_input.dart`**

```dart
import 'package:formz/formz.dart';

// Enum para los posibles errores del campo de nombre de usuario
enum UsernameError { empty }

class Username extends FormzInput<String, UsernameError> {
  const Username.pure() : super.pure('');
  const Username.dirty(String value) : super.dirty(value);

  @override
  UsernameError? validator(String value) {
    if (value.isEmpty) return UsernameError.empty;
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == UsernameError.empty) return 'El campo es requerido';
    return null;
  }
}
```

### Agregar Archivos de Exportación

**Archivo: `inputs.dart`**

```dart
export 'campo_str.dart'; // Exporta el campo de texto reutilizable
export 'campo_number.dart'; // Exporta el campo de número reutilizable
export 'email_input.dart'; // Exporta el campo de correo electrónico
export 'password_input.dart'; // Exporta el campo de contraseña
export 'username_input.dart'; // Exporta el campo de nombre de usuario
```

## 2. Crear el Estado del Formulario
Es necesario crear los 2 archivos el de state y el cubit, importante seguir todo el proceso.
Ten cuidado no existe FormzStatus, para tener status del formulario se necesita crear un enum

**Archivo: `register_state.dart`**

```dart
import 'package:equatable/equatable.dart';
import '../../inputs/inputs.dart';

part of 'register_cubit.dart';
//Te cuidado FormzStatus no existe no es libreria de Form, para conocer el status es necesario crear el enum
enum FormStatus { invalid, valid, validating, posting } // Enum para indicar los stados del formulario, creado por el usuario

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid, 
    this.isValid = false,
    this.username = const Username.pure(), 
    this.email = const Email.pure(), 
    this.password = const Password.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? username,
    Email? email,
    Password? password,
  }) {
    return RegisterFormState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [formStatus, isValid, username, email, password];
}
```

**Archivo: `register_cubit.dart`**

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        username: Username.dirty( state.username.value ),
        password: Password.dirty( state.password.value ),
        email: Email.dirty( state.email.value ),

        isValid: Formz.validate([
          state.username, 
          state.password,
          // TODO: state.email
        ])
      )
    );



    print('Cubit Submit: $state');
  }


  void usernameChanged( String value ) {
    final username = Username.dirty(value);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([ username, state.password, state.email ])
      )
    );
  }

  void emailChanged( String value ) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([ email, state.password, state.username ])
      )
    );
  }

  void passwordChanged( String value ) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([ password, state.username, state.email ])
      )
    );
  }


}
```

## 3. Crear el Archivo para Exportar Cubits

**Archivo: `auth_blocs.dart`**

```dart
export 'register_cubit.dart'; // Exporta el cubit de registro
export 'register_state.dart'; // Exporta el estado del cubit de registro
```

## 4. Crear el Formulario

**Archivo: `register_page.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../blocs/auth/auth_blocs.dart';
import '../inputs/inputs.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<RegisterCubit, RegisterFormState>(
          listener: (context, state) {
            if (state.formStatus == FormStatus.valid) {
              // Handle successful form submission
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Username'),
                  onChanged: (value) => context.read<RegisterCubit>().usernameChanged(value),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (value) => context.read<RegisterCubit>().emailChanged(value),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  onChanged: (value) => context.read<RegisterCubit>().passwordChanged(value),
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: () => context.read<RegisterCubit>().onSubmit(),
                  child: Text('Submit'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
```

## 5. Manejo de Estado con Cubits

Implementa el manejo del estado del formulario y los cambios de entrada utilizando el archivo `register_cubit.dart`.

## 6. Utilizar Inputs Reutilizables

Usa los inputs reutilizables para asegurar una validación estandarizada y una experiencia de usuario coherente.

