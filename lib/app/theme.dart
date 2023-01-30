import 'package:flutter/material.dart';

abstract class ThemeStyles {
  static ThemeData themeStatus(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        useMaterial3: true,
        indicatorColor: isDarkTheme ? Colors.white70 : Colors.black54,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light);
  }
}
