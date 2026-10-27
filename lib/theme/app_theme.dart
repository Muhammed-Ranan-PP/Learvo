import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 247, 249, 252),

    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 139, 92, 246),
    ),

    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Color.fromARGB(255, 26, 40, 86)),
      bodySmall: TextStyle(color: Color.fromARGB(255, 100, 116, 139)),
      titleMedium: TextStyle(
        color: Color.fromARGB(255, 26, 40, 86),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
