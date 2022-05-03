import 'package:flutter/material.dart';
import 'package:hidratese/infrastructure/theme/dark/color_schema_dark.dart';
import 'package:hidratese/infrastructure/theme/light/color_scheme.light.dart';

class AppTheme {
  get themeDatalight => ThemeData.light().copyWith(
      textTheme: textThemeLight,
      scaffoldBackgroundColor: colorSchemeLight.primary,
      textButtonTheme: textButtonThemeLight,
      outlinedButtonTheme: outLineBorderLight,
      textSelectionTheme: textSelectionThemeLight,
      appBarTheme: appBarLight);

  get themeDataDark => ThemeData.dark().copyWith(
      textTheme: textThemeDark,
      scaffoldBackgroundColor: colorSchemeDark.primary,
      textButtonTheme: textButtonThemeDark,
      outlinedButtonTheme: outLineBorderDrak,
      textSelectionTheme: textSelectionThemeDark,
      appBarTheme: appBarDark);
}
