import 'dart:ui';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import '../../common/style/app_colors.dart';
import '../../common/style/smooth_border_radius.dart';

void showCustomDialog(BuildContext context, Widget widget, Function(bool?) then,
    {double height = 300,
    EdgeInsets? padding = const EdgeInsets.only(left: 24, top: 32, right: 24),
    EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 24)}) {
  showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.4),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Center(
          child: CustomRoundedContainer(
            height: height,
            padding: padding,
            margin: margin,
            child: widget,
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  ).then((value) => then(value as bool?));
}

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer(
      {Key? key,
      this.margin = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      this.padding = const EdgeInsets.symmetric(vertical: 31),
      this.onTap,
      required this.child,
      this.borderRadiusGeometry,
      this.background,
      this.isHideBoxShadow = false,
      this.isShowBorder,
      this.radius = 16,
      this.boxBorder,
      this.boxShadows,
      this.borderRadius,
      this.width = double.infinity,
      this.borderColor,
      this.gradient,
      this.height})
      : super(key: key);
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Function()? onTap;
  final Widget child;
  final double? height;
  final double? width;
  final Color? background;
  final bool isHideBoxShadow;
  final double radius;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final BoxBorder? boxBorder;
  final List<BoxShadow>? boxShadows;
  final bool? isShowBorder;
  final SmoothBorderRadius? borderRadius;
  final Color? borderColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: ShapeDecoration(
            color: gradient != null ? null : background ?? ColorName.white,
            gradient: gradient,
            shadows: boxShadows,
            shape: SmoothRectangleBorder(
                borderRadius: borderRadius ?? CustomRadius.radius(radius),
                side: BorderSide(
                    color: borderColor ??
                        (isShowBorder != null
                            ? isShowBorder == true
                                ? ColorName.gray4
                                : ColorName.transparent
                            : isShowBorder == false
                                ? ColorName.transparent
                                : ColorName.gray4)))),
        child: child,
      ),
    );
  }
}
