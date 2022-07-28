import 'package:flutter/material.dart';

const errorColor = Color(0xFFFF2800);
const onErrorColor = Color.fromARGB(255, 255, 193, 182);

const primaryColor = Color(0xFFF27F0C);
const primaryColorLight = Color(0xFFF7ad19);

const secondaryColor = Color(0xFF429EBD);
const secondaryColorLight = Color(0xFF9FE7F5);
const secondaryColordark = Color(0xFF053F5C);

const backgroundColor = Colors.grey;
const loadingColor = Colors.grey;
const fontColor = Colors.white;
const fontFamily = 'Georgia';

final ThemeData overallTheme = ThemeData(
  fontFamily: fontFamily,
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: secondaryColorLight,
      secondary: secondaryColor,
      onSecondary: secondaryColordark,
      error: errorColor,
      onError: onErrorColor,
      background: backgroundColor,
      onBackground: secondaryColorLight,
      surface: Color.fromRGBO(0, 0, 0, 0),
      onSurface: Colors.white),
  iconTheme: const IconThemeData(
    color: secondaryColor,
  ),
);
