import 'package:flutter/material.dart';

const darkTextTheme = TextTheme(
  bodyLarge: TextStyle(
    color: Colors.white,
    fontSize: 28,
  ),
  bodyMedium: TextStyle(
    color: Colors.white,
    fontSize: 24,
  ),
  //bodySmall: TextStyle(),
  //displayLarge: TextStyle(),
  //displayMedium: TextStyle(),
  //displaySmall: TextStyle(),
  //headlineLarge: TextStyle(),
  //headlineMedium: TextStyle(),
  //headlineSmall: TextStyle(),
  //titleLarge: TextStyle(),
  //titleMedium: TextStyle(),
  //titleSmall: TextStyle(),
  //labelLarge: TextStyle(),
  //labelMedium: TextStyle(),
  //labelSmall: TextStyle(),
);

ThemeData darkTheme = ThemeData(
  fontFamily: 'Ubuntu',
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.amber,
    disabledColor: Colors.grey,
  ),
  textTheme: darkTextTheme
);