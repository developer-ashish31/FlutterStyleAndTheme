import 'package:flutter/material.dart';
import 'package:theme_and_style/theme/my_colors.dart';
import 'package:theme_and_style/theme/my_typography.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: MyColors.colorPrimary,
      appBarTheme: const AppBarTheme(color: MyColors.colorPrimary),
      textTheme: MyTextStyle.defaultTextTheme,
      colorScheme: _getAppColorScheme(Brightness.light),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: MyColors.colorPrimary),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              backgroundColor:
                  MaterialStateProperty.all<Color>(MyColors.colorAccent))),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1)));

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(color: MyColors.colorBlack87),
    colorScheme: _getAppColorScheme(Brightness.dark),
    textTheme: MyTextStyle.defaultTextTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: MyColors.colorBlack87),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all<Color>(Colors.grey),
      thumbColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),
  );

  static ColorScheme _getAppColorScheme(Brightness brightness) {
    return ColorScheme(
        primary: MyColors.primaryColor[brightness]!,
        secondary: MyColors.secondaryColor[brightness]!,
        surface: MyColors.canvasColor[brightness]!,
        background: MyColors.backgroundColor[brightness]!,
        error: MyColors.errorColor[brightness]!,
        onPrimary: MyColors.onPrimary[brightness]!,
        onSecondary: MyColors.onSecondary[brightness]!,
        onSurface: MyColors.onSurface[brightness]!,
        onBackground: MyColors.onBackgroundColor[brightness]!,
        onError: MyColors.onErrorColor[brightness]!,
        brightness: brightness);
  }
}
