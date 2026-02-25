import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xFF88A47C), // Ghibli green
    scaffoldBackgroundColor: Color(0xFFDDEBF7), // Ghibli sky blue
    cardColor: Color(0xFFFFF9F0), // soft cream
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF3A3A3A),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF88A47C),
      centerTitle: true,
      elevation: 0,
    ),
  );
}
