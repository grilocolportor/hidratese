import 'package:flutter/material.dart';
import 'package:hidratese/infrastructure/theme/dark/color_schema_dark.dart';

final  themeDataDark = ThemeData.dark().copyWith(
  textTheme: textThemeDark,
  scaffoldBackgroundColor: colorSchemeDark.primary,
  textButtonTheme: textButtonThemeDark,
  outlinedButtonTheme: outLineBorderDrak, 
    textSelectionTheme: textSelectionThemeDark,
    appBarTheme: appBarDark
);

