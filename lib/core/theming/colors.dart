import 'package:flutter/material.dart';

class ColorManager {
  static const Color gradientColor2 = Color(0xFFFEE3BC);
  static const Color gradientColor1 = Color(0xFFFEA14E);
  static const Gradient gradientBackgroundColor = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [gradientColor1, gradientColor2],
  );
  static Gradient gradientBackgroundColorDark = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [dark1, dark2],
  );
  static const Color black = Color(0xFF000000);
  static const Color lightBlack = Color(0xFF313341);
  static const Color darkPrimary = Color(0xFFE91E63);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9A938C);
  static const Color lightGrey = Colors.white60;
  static Color dark1 = Colors.grey[800]!;
  static Color dark2 = Colors.grey[600]!;
}
