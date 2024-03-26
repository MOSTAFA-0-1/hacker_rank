import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData mainTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xff292C31),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green))),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff292C31)),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        headline2: TextStyle(fontSize: 20, color: Colors.white),
        headline4: TextStyle(fontSize: 15, color: Colors.white),
      ));
}
