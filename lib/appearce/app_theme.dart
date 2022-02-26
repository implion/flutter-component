import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ThemeManager {
  static ThemeData get light => ThemeData(
    primaryColor: Colors.redAccent,
    highlightColor: Colors.redAccent,
    disabledColor: Colors.blueGrey,
    backgroundColor: Colors.white,
    textTheme: const TextTheme(
      headline5: TextStyle(fontSize: 24.0),
      subtitle1: TextStyle(fontSize: 16.0),
      subtitle2: TextStyle(fontSize: 14.0),
      bodyText1: TextStyle(fontSize: 12.0)
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      titleTextStyle: TextStyle(color: Colors.white)
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.redAccent,
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: Colors.redAccent,
    ),
  );

  static ThemeData get dark => ThemeData(
    primaryColor: Colors.blueGrey,
  );
}

extension AdditionThemeData on ThemeData {
  Color get lineColor {
    return Colors.grey;
  }
}
