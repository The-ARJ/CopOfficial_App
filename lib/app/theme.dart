import 'package:flutter/material.dart';

abstract class ThemeStyles {
  static ThemeData themeStatus(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        primaryColor: const Color(0xFF4F51A6),
        primarySwatch: const MaterialColor(0xFF4F51A6, {
          50: Color(0xFF4F51A6),
          100: Color(0xFF4F51A6),
          200: Color(0xFF4F51A6),
          300: Color(0xFF4F51A6),
          400: Color(0xFF4F51A6),
          500: Color(0xFF4F51A6),
          600: Color(0xFF4F51A6),
          700: Color(0xFF4F51A6),
          800: Color(0xFF4F51A6),
          900: Color(0xFF4F51A6),
        }),
        useMaterial3: true,
        indicatorColor: isDarkTheme ? Colors.white70 : Colors.black54,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light);
  }
}
