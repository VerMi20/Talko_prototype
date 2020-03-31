import 'package:flutter/cupertino.dart';

class ThemeColors {

  const ThemeColors();

  static const Color loginGradientStart = const Color(0xFF000000);
  static const Color loginGradientEnd = const Color(0xff008080);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}