import 'dart:ui';
import 'package:flutter/material.dart';

class GoPharmaColors {
  static const PrimaryColor = Color.fromRGBO(177, 61, 91, 1);
  static const PrimaryLightColor = Color.fromRGBO(246, 230, 240, 1);
  static const GreyColor = Color.fromRGBO(177, 199, 210, 1);

  static Color lighterSecondaryColor = PrimaryColor.withOpacity(0.1);
  static Color hintTextColor = PrimaryColor.withOpacity(0.4);
  static Color textBoxColor = PrimaryColor.withOpacity(0.7);

  static const BlackColor = Colors.black;
  static const WhiteColor = Colors.white;

  static const MaterialColor PrimaryMaterialColorScheme = MaterialColor(
    0xFFB13BC8,
    {
      50: Color.fromRGBO(177, 59, 200, .1),
      100: Color.fromRGBO(177, 59, 200, .2),
      200: Color.fromRGBO(177, 59, 200, .3),
      300: Color.fromRGBO(177, 59, 200, .4),
      400: Color.fromRGBO(177, 59, 200, .5),
      500: Color.fromRGBO(177, 59, 200, .6),
      600: Color.fromRGBO(177, 59, 200, .7),
      700: Color.fromRGBO(177, 59, 200, .8),
      800: Color.fromRGBO(177, 59, 200, .9),
      900: Color.fromRGBO(177, 59, 200, 1),
    },
  );

  static const MaterialColor SecondaryMaterialColorScheme = MaterialColor(
    0xFFB13D5B,
    {
      //    b13d5b
      50: Color.fromRGBO(177, 61, 91, .1),
      100: Color.fromRGBO(177, 61, 91, .2),
      200: Color.fromRGBO(177, 61, 91, .3),
      300: Color.fromRGBO(177, 61, 91, .4),
      400: Color.fromRGBO(177, 61, 91, .5),
      500: Color.fromRGBO(177, 61, 91, .6),
      600: Color.fromRGBO(177, 61, 91, .7),
      700: Color.fromRGBO(177, 61, 91, .8),
      800: Color.fromRGBO(177, 61, 91, .9),
      900: Color.fromRGBO(177, 61, 91, 1),
    },
  );

  static const MaterialColor TempMaterialColorScheme = MaterialColor(
    0xFF674EA7,
    {
      50: Color.fromRGBO(103, 78, 167, .1),
      100: Color.fromRGBO(103, 78, 167, .2),
      200: Color.fromRGBO(103, 78, 167, .3),
      300: Color.fromRGBO(103, 78, 167, .4),
      400: Color.fromRGBO(103, 78, 167, .5),
      500: Color.fromRGBO(103, 78, 167, .6),
      600: Color.fromRGBO(103, 78, 167, .7),
      700: Color.fromRGBO(103, 78, 167, .8),
      800: Color.fromRGBO(103, 78, 167, .9),
      900: Color.fromRGBO(103, 78, 167, 1),
    },
  );
}
