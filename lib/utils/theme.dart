import 'package:flutter/material.dart';

TextTheme darkTextTheme = const TextTheme(
  bodyLarge: TextStyle(
    color: Colors.white,
    fontSize: 18,
  ),
  bodyMedium: TextStyle(
    color: Colors.white,
    fontSize: 13,
  ),
  bodySmall: TextStyle(
    color: Colors.white,
    fontSize: 10,
  ),
  displayLarge: TextStyle(
    color: Color.fromRGBO(227, 186, 70, 1),
    fontSize: 18,
  ),
  displayMedium: TextStyle(
    color: Color.fromRGBO(227, 186, 70, 1),
    fontSize: 13,
  ),
  displaySmall: TextStyle(
    color: Color.fromRGBO(227, 186, 70, 1),
    fontSize: 10,
  ),
  headlineLarge: TextStyle(
    color: Colors.white,
    fontSize: 32,
  ),
  headlineMedium: TextStyle(
    color: Colors.white,
    fontSize: 26,
  ),
  headlineSmall: TextStyle(
    color: Colors.white,
    fontSize: 20,
  ),
  //titleLarge: TextStyle(),
  //titleMedium: TextStyle(),
  //titleSmall: TextStyle(),
  labelLarge: TextStyle(
    color: Colors.white,
    fontSize: 16,
    letterSpacing: 1,
  ),
  labelMedium: TextStyle(
    color: Colors.white,
    fontSize: 10,
  ),
  //labelSmall: TextStyle(),
);

ThemeData darkTheme = ThemeData(
  fontFamily: 'Ubuntu',
  colorScheme: const ColorScheme(
    primary: Color.fromRGBO(227, 186, 70, 1),
    secondary: Colors.red,
    brightness: Brightness.dark,
    onPrimary: Color.fromRGBO(227, 186, 70, 1),
    onSecondary: Colors.red,
    error: Colors.red,
    onError: Colors.red,
    background: Colors.black,
    onBackground: Colors.white,
    surface: Colors.transparent,
    onSurface: Colors.white,
  ),
  useMaterial3: true,
  brightness: Brightness.dark,
  textTheme: darkTextTheme
);