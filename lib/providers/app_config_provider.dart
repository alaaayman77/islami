import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';

  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString("language", appLanguage);
  }

  void changeTheme(ThemeMode newMode) async {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString("Theme", appTheme == ThemeMode.dark ? 'dark' : 'light');
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
