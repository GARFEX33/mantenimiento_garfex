import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF811210); // Rojo del logo
const Color secondaryColor = Color(0xFFFDB813); // Amarillo del logo
const Color backgroundColor = Color(0xFFFFFFFF); // Blanco para el fondo
const Color textColor = Color(0xFF000000); // Negro para el texto

final ThemeData appTheme = ThemeData(
  // Colores principales
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  colorScheme: ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
  ),

  // Estilo del AppBar
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Estilo de los botones
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, // Color del texto del botón
      backgroundColor: primaryColor, // Color de fondo del botón
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      textStyle: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  // Estilo de los campos de texto
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    labelStyle: TextStyle(color: primaryColor),
  ),

  // Estilo del texto
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textColor, fontSize: 16.0),
    bodyMedium: TextStyle(color: textColor, fontSize: 14.0),
    headlineSmall: TextStyle(color: textColor, fontSize: 24.0, fontWeight: FontWeight.bold),
  ),
);
