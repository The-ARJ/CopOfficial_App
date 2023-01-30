import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService with ChangeNotifier {
  SharedPreferences? sharedPreferences;
  bool? darkTheme;
  static String key = "key";
  ThemeService() {
    darkTheme = false;
    loadSp();
  }
  initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  saveSp() async {
    await initSp();
    darkTheme = await sharedPreferences!.setBool(key, darkTheme!);
  }

  loadSp() async {
    await initSp();
    darkTheme = sharedPreferences!.getBool(key);
    notifyListeners();
  }

  toggletheme() {
    darkTheme = !darkTheme!;
    saveSp();
    notifyListeners();
  }
}
