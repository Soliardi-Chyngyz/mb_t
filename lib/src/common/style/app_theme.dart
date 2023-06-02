import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbank_test/src/common/style/button_styles.dart';
import '../../../gen/fonts.gen.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: ColorName.main,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light),
        centerTitle: true,
        elevation: 0,
        toolbarTextStyle: TextStyle(
          fontSize: 16,
          height: 1.4,
          color: ColorName.main,
        ),
        titleTextStyle: TextStyle(
          fontSize: 16,
          height: 1.4,
          color: ColorName.black,
        ),
        iconTheme: IconThemeData(
          color: ColorName.main,
          size: 20,
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        elevation: 24,
        color: ColorName.gray4,
        shape: CircularNotchedRectangle(),
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: ColorName.white),
      primaryTextTheme: const TextTheme(
        bodyMedium: TextStyle(height: 1.4),
      ).apply(
        fontFamily: FontFamily.currency,
        displayColor: ColorName.black,
        bodyColor: ColorName.black,
        decorationColor: ColorName.black,
      ),
      unselectedWidgetColor: ColorName.red,
      fontFamily: FontFamily.currency,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: ColorName.main,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, height: 1.6),
      )),
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: AppButtonStyles.commonButtonStyle()),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              foregroundColor: ColorName.main,
              // padding: const EdgeInsets.all(Dimensions.val15),
              shape: const SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius.all(
                SmoothRadius(
                  cornerRadius: 12,
                  cornerSmoothing: 1,
                ),
              )),
              elevation: 0,
              side: const BorderSide(color: ColorName.main, width: 1.2),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 1.2,
              ))),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(linearTrackColor: Colors.white),
      colorScheme: const ColorScheme.light(primary: ColorName.main)
          .copyWith(background: ColorName.white));

  static ThemeData darkTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: const Color(0xFF212225),
      primaryColor: ColorName.main,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark),
        centerTitle: true,
        elevation: 0,
        toolbarTextStyle: const TextStyle(
          fontSize: 16,
          height: 1.4,
          color: ColorName.main,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          height: 1.4,
          color: ColorName.black,
        ),
        iconTheme: const IconThemeData(
          color: ColorName.main,
          size: 20,
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        elevation: 24,
        color: ColorName.gray4,
        shape: CircularNotchedRectangle(),
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: ColorName.white),
      primaryTextTheme: const TextTheme(
        bodyMedium: TextStyle(height: 1.4),
      ).apply(
        fontFamily: FontFamily.currency,
        displayColor: ColorName.white,
        bodyColor: ColorName.white,
        decorationColor: ColorName.white,
      ),
      fontFamily: FontFamily.currency,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: ColorName.main,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, height: 1.6),
      )),
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: AppButtonStyles.commonButtonStyle()),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: ColorName.main,
              shape: const SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius.all(
                SmoothRadius(
                  cornerRadius: 12,
                  cornerSmoothing: 1,
                ),
              )),
              elevation: 0,
              side: const BorderSide(color: ColorName.main, width: 1.2),
              minimumSize: const Size(double.infinity, 48),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 1.2,
              ))),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          linearTrackColor: Colors.transparent),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        background: ColorName.gray1,
        primary: ColorName.main,
      ));
}
