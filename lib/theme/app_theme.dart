import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFF7F9FC),

    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFF8B5CF6),
    ),

    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Color(0xFF1A2856),
      ),
      bodySmall: TextStyle(
        color: Color(0xFF64748B),
      ),
      titleMedium: TextStyle(
        color: Color(0xFF1A2856),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}