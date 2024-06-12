import 'package:flutter/material.dart';
import 'package:my_weather/core/theming/colors.dart';

class ThemeDataStyle {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: ColorManager.gradientColor1,
      secondary: ColorManager.gradientColor2,
      scrim: ColorManager.lightBlack,
      surface: ColorManager.grey,
      brightness: Brightness.light,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: ColorManager.dark1,
      secondary: ColorManager.dark2,
      brightness: Brightness.dark,
      scrim: ColorManager.white,
      surface: ColorManager.lightGrey,
    ),
  );
}
