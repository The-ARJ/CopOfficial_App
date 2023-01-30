import 'package:copofficial_app/app/preferences.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  MyPreferences myPreferences = MyPreferences();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    myPreferences.setTheme(value);
    notifyListeners();
  }
}
