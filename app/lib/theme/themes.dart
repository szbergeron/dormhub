import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.white,
  indicatorColor: Colors.white
);

final lightTheme = ThemeData(
  primaryColor: Color(0xff0044bb), //unh blue
  brightness: Brightness.light,
  backgroundColor: Color(0xffffffff),
  cardColor: Colors.white,
  accentColor: Color(0xff0044bb), //dark blue
  accentIconTheme: IconThemeData(color: Colors.blue),
  
  dividerColor: Colors.blue,
  indicatorColor: Colors.black
  
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