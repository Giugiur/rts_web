import 'package:flutter/material.dart';

const darkTextTheme = TextTheme(
  bodyLarge: TextStyle(
    color: Colors.white,
    fontSize: 18,
  ),
  bodyMedium: TextStyle(
    color: Colors.white,
    fontSize: 14,
  ),
  bodySmall: TextStyle(
    color: Colors.white,
    fontSize: 10,
  ),
  //displayLarge: TextStyle(),
  //displayMedium: TextStyle(),
  //displaySmall: TextStyle(),
  headlineLarge: TextStyle(
    color: Colors.white,
    fontSize: 28,
  ),
  headlineMedium: TextStyle(
    color: Colors.white,
    fontSize: 24,
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
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
  textTheme: darkTextTheme
);