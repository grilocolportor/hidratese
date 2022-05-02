import 'package:flutter/material.dart';
import 'package:hidratese/infrastructure/utils/utils.dart';

final colorSchemeDark = ColorScheme.dark(
  primary: Color(Utils.getColorFromHex('#173447')),
  secondary: Colors.white,
  tertiary: Colors.lightBlue
);

final textStyleDark = TextStyle(color: colorSchemeDark.secondary);
final textThemeDark = TextTheme(
  headline1: textStyleDark,
  headline2: textStyleDark,
  headline3: textStyleDark,
  headline4: textStyleDark,
  headline5: textStyleDark,
  headline6: textStyleDark,
  subtitle1: textStyleDark,
  subtitle2: textStyleDark,
  bodyText1: textStyleDark,
  bodyText2: textStyleDark,
  caption: textStyleDark,
  button: textStyleDark,
  overline: textStyleDark,
);

final textButtonThemeDark = TextButtonThemeData(
  style: TextButton.styleFrom(primary: colorSchemeDark.tertiary),
);

final outLineBorderDrak = OutlinedButtonThemeData(
  style: TextButton.styleFrom(
      side: BorderSide(color: colorSchemeDark.tertiary, width: 1)),
);

final textSelectionThemeDark = TextSelectionThemeData(
  cursorColor: colorSchemeDark.tertiary,
  selectionColor: Colors.blue.shade200,
);


final appBarDark= AppBarTheme(
  backgroundColor: colorSchemeDark.primary,
  elevation: 0
);
