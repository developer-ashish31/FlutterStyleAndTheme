import 'package:flutter/material.dart';

class MyColors {
  static const colorPrimary = Colors.deepOrangeAccent;
  static const colorAccent = Colors.orange;
  static const colorBlack87 = Colors.black87;
  static const _colorWhite = Colors.white;
  static const _colorBlack = Colors.black;

  static const _colorWhite38 = Colors.white60;
  static const _colorBlack87 = Colors.black87;

  static const Color _genuineBlue = Color(0xFF0B78AF);
  static const Color _limeGreen = Color(0xFF25EC6C);

  static const Color _pureWhite = Color(0xFFFFFFFF);
  static const Color _pureDark = Color(0xFF000000);

  static const Color _foundationGrey = Color(0xFFF2F2F2);
  static const Color _foundationGreyDark = Color(0xFF0D0D0D);

  static const Color _actionRed = Color(0xFFAE0000);
  static const Color _cautiousRed = Color(0xFFEFCCCC);
  static const Color _cautiousRedDark = Color(0xFF340000);

  static const Color _informGrey = Color(0xFF191919);
  static const Color _boundaryGrey = Color(0xFFE5E5E5);


  static final Map<Brightness, Color> titleMediumColor = _buildColor(
      lightColor: MyColors._colorBlack, darkColor: MyColors._colorWhite);

  static final Map<Brightness, Color> titleSmallColor = _buildColor(
      lightColor: MyColors._colorBlack87, darkColor: MyColors._colorWhite38);

  static final Map<Brightness, Color> primaryColor = _buildColor(
      lightColor: MyColors._genuineBlue, darkColor: MyColors._genuineBlue);

  static final Map<Brightness, Color> secondaryColor = _buildColor(
      lightColor: MyColors._limeGreen, darkColor: MyColors._limeGreen);

  static final Map<Brightness, Color> canvasColor = _buildColor(
      lightColor: MyColors._pureWhite, darkColor: MyColors._pureDark);

  static final Map<Brightness, Color> backgroundColor = _buildColor(
      lightColor: MyColors._foundationGrey,
      darkColor: MyColors._foundationGreyDark);

  static final Map<Brightness, Color> errorColor = _buildColor(
      lightColor: MyColors._cautiousRed,
      darkColor: MyColors._cautiousRedDark);

  static final Map<Brightness, Color> onPrimary = _buildColor(
      lightColor: MyColors._pureWhite, darkColor: MyColors._pureDark);

  static final Map<Brightness, Color> onSecondary = _buildColor(
      lightColor: MyColors._informGrey, darkColor: MyColors._boundaryGrey);

  static final Map<Brightness, Color> onSurface = _buildColor(
      lightColor: MyColors._informGrey, darkColor: MyColors._boundaryGrey);

  static final Map<Brightness, Color> onBackgroundColor = _buildColor(
      lightColor: MyColors._informGrey, darkColor: MyColors._boundaryGrey);

  static final Map<Brightness, Color> onErrorColor = _buildColor(
      lightColor: MyColors._actionRed, darkColor: MyColors._actionRed);

  static Map<Brightness, Color> _buildColor(
      {required Color lightColor, required Color darkColor}) {
    final Map<Brightness, Color> colorMap = {};

    colorMap.putIfAbsent(Brightness.light, () => lightColor);
    colorMap.putIfAbsent(Brightness.dark, () => darkColor);

    return colorMap;
  }
}
extension ColorMap on Map<Brightness, Color> {
  Color? get lightColor => this[Brightness.light];

  Color? get darkColor => this[Brightness.dark];

  Color? platformBrightnessColor(BuildContext context) {
    // We need to check the theme mode to be able disable dark mode completely.
    // Indeed, Platform.brightness will still be `dark` even if we force the ThemeMode to be `light` in the MaterialApp.
    final ThemeMode themeMode =
        context.findAncestorWidgetOfExactType<MaterialApp>()?.themeMode ??
            ThemeMode.system;
    final Brightness brightness;

    switch (themeMode) {
      case ThemeMode.system:
        brightness = MediaQuery.of(context).platformBrightness;
        break;
      case ThemeMode.light:
        brightness = Brightness.light;
        break;
      case ThemeMode.dark:
        brightness = Brightness.dark;
        break;
    }
    return this[brightness];
  }
}

