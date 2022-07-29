import 'package:flutter/material.dart';

const errorColor = Color(0xFFFF2800);
const onErrorColor = Color.fromARGB(255, 255, 193, 182);

const secondaryColor = Color(0xFFF27F0C);
const secondaryColorLight = Color(0xFFF7ad19);
const secondaryColordark = Color.fromARGB(255, 196, 83, 12);
const primaryColor = Color(0xFF429EBD);
const primaryColorLight = Color(0xFF9FE7F5);
const primaryColordark = Color(0xFF053F5C);

const backgroundColor = Colors.grey;
const loadingColor = Colors.grey;
const surface = primaryColor;
const onSuface = fontColor;

const fontColor = Colors.white;
const fontFamily = 'Georgia';

final ThemeData overallTheme = ThemeData(
  fontFamily: fontFamily,
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: fontColor,
      secondary: secondaryColor,
      onSecondary: fontColor,
      error: errorColor,
      onError: onErrorColor,
      background: backgroundColor,
      onBackground: secondaryColorLight,
      surface: onSuface,
      onSurface: fontColor),
  iconTheme: const IconThemeData(
    color: secondaryColor,
  ),
);
