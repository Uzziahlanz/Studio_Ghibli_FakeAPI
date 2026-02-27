import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // Core colors from your provided theme
    primaryColor: const Color(0xFF00BFFF),
    scaffoldBackgroundColor: const Color(0xFFCFF3F3),

    // Optional UI colors
    cardColor: const Color(0xFFFFF9F0),

    // Text styling (kept from your original)
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black87,
        fontSize: 16,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF3A3A3A),
      ),
    ),

    // AppBar updated to match primary color
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF00BFFF),
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
  );
}