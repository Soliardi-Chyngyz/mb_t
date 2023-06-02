import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColorName {
  ColorName();

  ColorName._();

  static const main = Color(0xFF69D7D4);

  static const black = Color(0xFF212225);

  static const white = Colors.white;

  static const silver = Color(0xFFD2D0D0);

  static const black2 = Color(0xFF2A2D34);

  static const gray1 = Color(0xFF4F5864);

  static const gray2 = Color(0xFF6D7784);

  static const gray3 = Color(0xFFA0A7AF);

  static const gray4 = Color(0xFFE1E7EE);

  static const gray5 = Color(0xFFF4F8FD);

  static const gray6 = Color(0xFFF0F2F3);

  static const bgProfile = Color(0xFFF3F5F6);

  static const background = Color(0xFFFFFFFF);

  static const Color red = Color(0xFFE53D18);

  static const Color grey = Color(0xFFEBEBEB);

  static const Color green = Color(0xFF49A842);

  static const Color transparent = Colors.transparent;

  static const LinearGradient linear1 = LinearGradient(
    colors: [
      Color(0xFF8EBBFF),
      Color(0xFF51BDE1),
    ],
    // stops: [0.5, 1.0],
    begin: Alignment(-1.0, 1),
    end: Alignment(1, -1),
    transform: GradientRotation(math.pi / 8),
    // tileMode: TileMode.mirror,
  );

  static const main2Shadow = Color(0xff748EAA);

  static const LinearGradient linear3 = LinearGradient(
    colors: [
      Color(0xFFFE7757),
      Color(0xFFFC3143),
    ],
  );

  static const LinearGradient linear5 = LinearGradient(
    colors: [
      Color(0xFFFFD710),
      Color(0xFFF99909),
    ],
  );
}
