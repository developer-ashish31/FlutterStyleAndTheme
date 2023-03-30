import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyle {
  static TextTheme defaultTextTheme = TextTheme(
    // displaySmall: TabTextStyle._getHeading3(),
    // headlineMedium: TabTextStyle._getHeading4(),
    // headlineSmall: TabTextStyle._getHeading5(),
    titleLarge: MyTextStyle._getTitleLarge(),
    titleMedium: MyTextStyle._getTitleMedium(),
    titleSmall: MyTextStyle._getTitleSmall(),
    // bodyLarge: TabTextStyle._getBody1Default(),
    // bodyMedium: TabTextStyle._getBody2Default(),
    // labelLarge: TabTextStyle._getButton1(),
    // bodySmall: TabTextStyle._getCaptionDefault(),
    labelSmall: MyTextStyle._getLabelSmall(),
  );

  static TextStyle _getTitleLarge() => const TextStyle(
      fontSize: 26, fontWeight: FontWeight.w800, letterSpacing: 0.2,
      fontFamily: 'DancingScript');

  static _getTitleMedium() => const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.16);

  static _getTitleSmall() => const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.14);

  static _getLabelSmall() => GoogleFonts.aBeeZee(
      fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.14);
}
