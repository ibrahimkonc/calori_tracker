import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  Color themeColor = Colors.pink;

  ThemeData _currentTheme = ThemeData.light();

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: themeColor),
        );
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: themeColor),
        );
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.dark().copyWith(
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: const Color(0xff16202b),
          textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xff48a0eb),
          ),
        );
        break;
      default:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: themeColor),
        );
    }
  }

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  set darkTheme(bool valor) {
    _customTheme = false;
    _darkTheme = valor;
    if (valor) {
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: themeColor),
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: themeColor),
      );
    }
    notifyListeners();
  }

  set customTheme(bool valor) {
    _darkTheme = false;
    _customTheme = valor;
    if (valor) {
      _currentTheme = ThemeData.dark().copyWith(
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: const Color(0xff16202b),
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xff48a0eb)),
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
      );
    }
    notifyListeners();
  }
}
