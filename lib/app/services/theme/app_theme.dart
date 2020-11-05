import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF4D59DE),
    scaffoldBackgroundColor: Colors.white,
    accentColor: Color(0xFFEFEFEF),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColor: Color(0xFF121212), 
    // textTheme: TextTheme().copyWith(
    //   bodyText2:  TextStyle(color: Colors.black),
    // )
  );
}

// Color(0xFF222222),
// Color(0xFF101010)
// Color(0xFF272727)
//Color(0xFF363636)
//Color(0xFF464646)
// Color(0xFF505050)