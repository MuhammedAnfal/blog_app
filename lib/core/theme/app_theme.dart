import 'package:blog_app/core/theme/palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = Palette.backgroundColor]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(width: 3, color: color),
  );

  // final darkMode = ThemeData.dark().copyWith(
  //   // ba
  // );
  final lightMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Palette.primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(Palette.buttonColor),
    ),
  );
}
