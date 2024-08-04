import 'package:flutter/material.dart';
import 'package:mantenimiento_garfex/screens/tablero_form_screen.dart';
import 'package:mantenimiento_garfex/screens/transformador_form_screen.dart';
import '../screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case '/tableros':
      return MaterialPageRoute(builder: (_) => TableroFormScreen());
    case '/transformadores':
      return MaterialPageRoute(builder: (_) => TransformadorFormScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Ruta no encontrada')),
        ),
      );
  }
}
