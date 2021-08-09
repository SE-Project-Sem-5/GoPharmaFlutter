import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';

/* Theme data for the app and color scheme to be used */
ThemeData buildThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: 'SF-Pro',
    brightness: Brightness.light,
    primaryColor: GoPharmaColors.SecondaryMaterialColorScheme,
    accentColor: GoPharmaColors.SecondaryMaterialColorScheme,
    primarySwatch: GoPharmaColors.SecondaryMaterialColorScheme,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );
}
