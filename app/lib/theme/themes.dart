import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.white,
);

final lightTheme = ThemeData(
  primaryColor: Color(0xff0044bb), //unh blue
  brightness: Brightness.light,
  backgroundColor: Color(0xffffffff),
  
  accentColor: Color(0xff0044bb), //dark blue
  accentIconTheme: IconThemeData(color: Colors.blue),
  
  dividerColor: Colors.blue,
  
);



class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}