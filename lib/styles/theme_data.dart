import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get data {
    // Define light theme colors, fonts, etc.
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green,
          secondary: Colors.white,
        ),
        fontFamily: 'Noto',
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
          bodyMedium: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white),
          bodyLarge: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      );
  }
}