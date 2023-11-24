import 'package:flutter/material.dart';

class DarkModeNotifier extends ChangeNotifier {
  DarkModeNotifier(bool isDarkMode) {
    _isDarkMode = isDarkMode;
  }

  late bool _isDarkMode;

  bool get isDarkMode => _isDarkMode;

  changeMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
