import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:mbank_test/src/common/style/smooth_border_radius.dart';

import 'app_colors.dart';

class AppButtonStyles {
  static ButtonStyle commonButtonStyle() {
    return ElevatedButton.styleFrom(
        backgroundColor: ColorName.main,
        elevation: 10,
        shadowColor: ColorName.main.withOpacity(0.35),
        foregroundColor: Colors.white,
        shape: const SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.all(
          SmoothRadius(
            cornerRadius: 16,
            cornerSmoothing: 1,
          ),
        )),
        padding: EdgeInsets.zero,
        minimumSize: const Size(double.infinity, 48),
        textStyle: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 16, height: 1.2));
  }

  static ButtonStyle whiteBackElevatedButton(
      {TextStyle? textStyle,
      Color color = ColorName.red,
      Color? backgroundColor}) {
    return ElevatedButton.styleFrom(
        foregroundColor: color,
        backgroundColor: backgroundColor ?? ColorName.white,
        shape: SmoothRectangleBorder(
          borderRadius: CustomRadius.radius(12),
        ),
        elevation: 0.0,
        shadowColor: ColorName.transparent,
        textStyle: textStyle ??
            const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 16, height: 1.2));
  }

  static ButtonStyle underLineTextButton(
      {TextStyle? textStyle, Color color = ColorName.red}) {
    return TextButton.styleFrom(
        foregroundColor: ColorName.white,
        elevation: 0.0,
        shadowColor: ColorName.transparent,
        textStyle: textStyle ??
            TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 1.2,
                color: color));
  }

  static ButtonStyle whithIconElevatedButton(
      {TextStyle? textStyle, Color color = ColorName.main}) {
    return ElevatedButton.styleFrom(
        foregroundColor: color,
        backgroundColor: ColorName.gray5,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0.0,
        shadowColor: ColorName.transparent,
        textStyle: textStyle ??
            const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16, height: 1.2));
  }

  static ButtonStyle outlinedButtonStyle(
      {TextStyle? textStyle,
      Color color = ColorName.main,
      double height = 1.2}) {
    return OutlinedButton.styleFrom(
        foregroundColor: color,
        shape: SmoothRectangleBorder(
          borderRadius: CustomRadius.radius(12),
        ),
        side: BorderSide(width: 1, color: color),
        fixedSize: const Size(1000, 48),
        backgroundColor: Colors.transparent,
        textStyle: textStyle ??
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: color,
              height: height,
            ));
  }
}
