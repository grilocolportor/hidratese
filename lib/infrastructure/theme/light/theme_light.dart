import 'package:flutter/material.dart';
import 'package:hidratese/infrastructure/theme/light/color_scheme.light.dart';

final themeDatalight = ThemeData.light().copyWith(
    textTheme: textThemeLight,
    scaffoldBackgroundColor: colorSchemeLight.primary,
    textButtonTheme: textButtonThemeLight,
    outlinedButtonTheme: outLineBorderLight, 
    textSelectionTheme: textSelectionThemeLight);
