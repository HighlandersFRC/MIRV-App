import 'package:flutter/material.dart';

const errorColor = Color(0xFFFF2800);
const onErrorColor = Color.fromARGB(255, 255, 193, 182);

const primaryColor = Color.fromRGBO(242, 127, 12, 1);
const primaryColorLight = Color(0xFFF7ad19);
const primaryColordark = Color.fromARGB(255, 196, 83, 12);
const secondaryColor = Color.fromRGBO(66, 158, 189, 1);
const secondaryColorLight = Color(0xFF9FE7F5);
const secondaryColordark = Color.fromRGBO(5, 63, 92, 1);

const backgroundColor = Color(0xFF053F5C);
const loadingColor = Colors.grey;
const surface = primaryColordark;
const onSuface = primaryColor;

const tileColorAvailable = Color.fromARGB(255, 59, 59, 59);
const tileColorSelected = secondaryColor;
const tileColorUnavailible = Color.fromARGB(255, 165, 55, 36);

const fontColor = Colors.white;
const fontFamily = 'Georgia';

const double homeFontSize = 18;

final ThemeData overallTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
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
