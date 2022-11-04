import 'package:flutter/material.dart';
import './constants.dart';

ThemeData theme() {
  MaterialColor myMaterialColor = const MaterialColor(0xFFE33434, const {
    50: const Color(0xFFE33434),
    100: const Color(0xFFE33434),
    200: const Color(0xFFE33434),
    300: const Color(0xFFE33434),
    400: const Color(0xFFE33434),
    500: const Color(0xFFE33434),
    600: const Color(0xFFE33434),
    700: const Color(0xFFE33434),
    800: const Color(0xFFE33434),
    900: const Color(0xFFE33434)
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
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline1: TextStyle(color: mySecondTextColor),
      headline6: TextStyle(color: mySecondTextColor),
    ),
  );
}
