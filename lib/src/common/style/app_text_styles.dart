import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle semiRegular13(
      BuildContext context, {
        Color? color,
        double? height,
      }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w300,
      color: color ?? ColorName.white,
      height: height ?? 1.2,
    );
  }

  static TextStyle semiRegular14(
      BuildContext context, {
        Color? color,
        double? height,
      }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: color ?? ColorName.white,
      height: height ?? 1.2,
    );
  }

  static TextStyle regular10(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: color,
          height: height ?? 1.2,
        );
  }

  static TextStyle regular12(
    BuildContext context, {
    Color? color,
    double? height,
    bool lineThrough = false,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
          overflow: TextOverflow.ellipsis,
          decoration: lineThrough ? TextDecoration.lineThrough : null,
        );
  }

  static TextStyle regular14(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle regular16(
    BuildContext context, {
    Color? color,
    double? height,
    bool underline = false,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          color: color ?? ColorName.white,
          decorationColor: color ?? ColorName.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          decoration: underline ? TextDecoration.underline : null,
          height: height ?? 1.2,
        );
  }

  static TextStyle regular17(
    BuildContext context, {
    Color? color,
    double? height,
    bool underline = false,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          decoration: underline ? TextDecoration.underline : null,
          color: color,
          height: height ?? 1.2,
          decorationColor: color,
        );
  }

  static TextStyle regular18(
    BuildContext context, {
    Color? color,
    double? height,
    TextDecoration? textDecoration,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
          decoration: textDecoration,
          decorationColor: color,
        );
  }

  static TextStyle regular21(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 21,
          fontWeight: FontWeight.w400,
          color: color,
          height: height ?? 1.2,
        );
  }

  static TextStyle regular24(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: color,
          height: height ?? 1.2,
        );
  }

  static TextStyle bold14(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: color,
          height: height ?? 1.2,
        );
  }

  static TextStyle medium16(
    BuildContext context, {
    Color? color,
    double? height,
    bool underLine = false,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color ?? ColorName.white,
        height: height ?? 1.2,
        decorationColor: color,
        decoration: underLine ? TextDecoration.underline : null);
  }

  static TextStyle medium18(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle medium13(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle medium24(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle medium12(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle medium14(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? ColorName.white,
        height: height ?? 1.2,
    );
  }

  static TextStyle medium15(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle medium20(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle bold18(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle bold21(
      BuildContext context, {
        Color? color,
        double? height,
      }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
      fontSize: 21,
      fontWeight: FontWeight.w700,
      color: color ?? ColorName.white,
      height: height ?? 1.2,
    );
  }

  static TextStyle bold24(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle bold32(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle bold48(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle semiBold32(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }


  static TextStyle semiBold24(
      BuildContext context, {
        Color? color,
        double? height,
      }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: color ?? ColorName.white,
      height: height ?? 1.2,
    );
  }

  static TextStyle semiBold21(
      BuildContext context, {
        Color? color,
        double? height,
      }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
      fontSize: 21,
      fontWeight: FontWeight.w600,
      color: color ?? ColorName.white,
      height: height ?? 1.2,
    );
  }

  static TextStyle semiBold18(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle semiBold16(
    BuildContext context, {
    Color? color,
    double? height,
    bool lineThrough = false,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
          decoration: lineThrough ? TextDecoration.lineThrough : null,
        );
  }

  static TextStyle semiBold17(
      BuildContext context, {
        Color? color,
        double? height,
        bool lineThrough = false,
      }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: color ?? ColorName.white,
      height: height ?? 1.2,
      decoration: lineThrough ? TextDecoration.lineThrough : null,
    );
  }

  static TextStyle semiBold14(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle semiBold10(
      BuildContext context, {
        Color? color,
        double? height,
      }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: color ?? ColorName.white,
      height: height ?? 1.2,
    );
  }

  static TextStyle light12(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }

  static TextStyle light14(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: color ?? ColorName.white,
          height: height ?? 1.2,
        );
  }
}
