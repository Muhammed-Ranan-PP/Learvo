import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF7F9FC),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF7F9FC),
      foregroundColor: Color(0xFF1A2856),
      elevation: 0,
      centerTitle: true,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8B5CF6),primary: const Color(0xFF8B5CF6),),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Color(0xFF1A2856),
      ),
    ),
  );
}
