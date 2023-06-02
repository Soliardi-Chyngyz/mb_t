import 'package:figma_squircle/figma_squircle.dart';

class CustomRadius {
  static SmoothBorderRadius radius(double r) => SmoothBorderRadius.all(
        SmoothRadius(
          cornerRadius: r,
          cornerSmoothing: 1,
        ),
      );
  static SmoothBorderRadius top(double r) => SmoothBorderRadius.vertical(
        top: SmoothRadius(
          cornerSmoothing: 1,
          cornerRadius: r,
        ),
      );

  static SmoothBorderRadius bottom(double r) => SmoothBorderRadius.vertical(
        bottom: SmoothRadius(
          cornerSmoothing: 1,
          cornerRadius: r,
        ),
      );

  static SmoothBorderRadius left(double r) => SmoothBorderRadius.horizontal(
        left: SmoothRadius(
          cornerSmoothing: 1,
          cornerRadius: r,
        ),
      );

  static SmoothBorderRadius right(double r) => SmoothBorderRadius.horizontal(
        right: SmoothRadius(
          cornerSmoothing: 1,
          cornerRadius: r,
        ),
      );
}
