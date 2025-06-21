import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFF3936E5);
  static const primaryDark = Color.fromARGB(255, 11, 9, 158);
  static const blueColor = Color(0xFF4285f4);
  static const warningColor = Color.fromARGB(255, 255, 158, 14);
  static const warningColorDark = Color.fromARGB(255, 255, 166, 42);
  static const grayColor = Color(0xFFA5A5A5);
  static const successColor = Color(0xFF43A048);
  static const white = Color(0xFFFFFFFF);
  static const normalBlack = Color(0xFF4F4F4F);
  static const deepBlack = Color(0xFF121212);
  static const textColor = Color(0xFF1E1E1E);
  static const errorColor = Color(0xffEB5757);
  static const backgroundColor = Color(0XFFF8F8F8);
  static List<Color> primaryColorOptions = const [
    primary,
  ];
  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    Map<int, Color> colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color, //Primary value
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }
}
