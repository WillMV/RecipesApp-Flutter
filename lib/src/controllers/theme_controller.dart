import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  static ThemeProvider instance = ThemeProvider();

  bool isDarkTheme = false;

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  Widget getButtonIcon() {
    return isDarkTheme
        ? const Icon(Icons.dark_mode)
        : const Icon(Icons.light_mode);
  }

  ThemeData getTheme() {
    return isDarkTheme
        ? ThemeData(
            brightness: Brightness.dark,
          )
        : ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.amber,
          );
  }
}
