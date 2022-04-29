import 'package:flutter/material.dart';
import 'package:hidratese/infrastructure/utils/utils.dart';

final colorSchemeLight = ColorScheme.light(
    primary: Colors.white,
    secondary: Color(Utils.getColorFromHex('#173447')),
    tertiary: Colors.blueAccent);

final textStyleWhite = TextStyle(
  color: colorSchemeLight.secondary,
);
final textThemeLight = TextTheme(
  headline1: textStyleWhite,
  headline2: textStyleWhite,
  headline3: textStyleWhite,
  headline4: textStyleWhite,
  headline5: textStyleWhite,
  headline6: textStyleWhite,
  subtitle1: textStyleWhite,
  subtitle2: textStyleWhite,
  bodyText1: textStyleWhite,
  bodyText2: textStyleWhite,
  caption: textStyleWhite,
  button: textStyleWhite,
  overline: textStyleWhite,
);

final textButtonThemeLight = TextButtonThemeData(
  style: TextButton.styleFrom(primary: colorSchemeLight.tertiary),
);
