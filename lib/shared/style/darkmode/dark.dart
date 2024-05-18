import 'package:detection/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  ThemeData getTheme() {
    if (_isDarkMode) {
      return ThemeData.dark().copyWith(
        primaryColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[850],
          elevation: 0.0,
          titleTextStyle: TextStyle(
              color: white,
              fontWeight:FontWeight.w900,
              fontSize: 20.0
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light
          ),
        ),
      );
    } else {
      return ThemeData.light().copyWith(
        primaryColor: green,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor:Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 20.0
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark
          ),
        ),
      );
    }
  }
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
