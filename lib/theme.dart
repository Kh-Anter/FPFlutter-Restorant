import 'package:flutter/material.dart';
import './constants.dart';

ThemeData theme() {
  MaterialColor myMaterialColor = const MaterialColor(0xFFFA4A0C, const {
    50: const Color(0xFFFA4A0C),
    100: const Color(0xFFFA4A0C),
    200: const Color(0xFFFA4A0C),
    300: const Color(0xFFFA4A0C),
    400: const Color(0xFFFA4A0C),
    500: const Color(0xFFFA4A0C),
    600: const Color(0xFFFA4A0C),
    700: const Color(0xFFFA4A0C),
    800: const Color(0xFFFA4A0C),
    900: const Color(0xFFFA4A0C)
  });

  return ThemeData(
    primarySwatch: myMaterialColor,
    appBarTheme: appBarTheme(),
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    titleTextStyle: TextStyle(
        color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
  );
}
