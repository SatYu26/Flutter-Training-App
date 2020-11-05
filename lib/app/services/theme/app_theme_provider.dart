import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModel {
  static bool theme(BuildContext context) {
    return Provider.of<AppThemeProvider>(context, listen: false).isDark;
  }
}

class AppThemeProvider with ChangeNotifier {
  final String key = 'theme';

  bool _isDarkMoodOn;

  void toggleTheme() {
    _isDarkMoodOn = !_isDarkMoodOn;
    _saveToPrefs();
    notifyListeners();
  }

  bool get isDark => _isDarkMoodOn;
  AppThemeProvider() {
    _isDarkMoodOn = false;
    _loadFromPrefs();
  }

  SharedPreferences _prefs;

  Future<void> _initPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<void> _loadFromPrefs() async {
    await _initPrefs();
    _isDarkMoodOn = _prefs.getBool(key) ?? false;
    notifyListeners();
  }

  void _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _isDarkMoodOn);
  }
}
