import 'package:flutter/material.dart';
import 'package:food_delivery/themes/dark_mode.dart';
import 'package:food_delivery/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _selectedTheme = lightMode;

  ThemeData get getTheme => _selectedTheme;

  bool get isDarkMode => _selectedTheme == darkMode;

  set themeData(ThemeData theme) {
    _selectedTheme = theme;
    notifyListeners();
  }
  void toggleTheme() {
    _selectedTheme = _selectedTheme == darkMode ? lightMode : darkMode;
    notifyListeners();
  }
}
