import 'package:flutter/material.dart';
import '../../common/style/app_colors.dart';
import '../../common/style/app_text_styles.dart';

class CustomRichTextWidget extends StatelessWidget {
  const CustomRichTextWidget(
      {Key? key,
      required this.title,
      required this.desc,
      this.color = ColorName.white})
      : super(key: key);
  final String title;
  final String desc;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: AppTextStyles.regular14(
          context,
          color: ColorName.gray2,
        ),
        children: <TextSpan>[
          TextSpan(
              text: desc,
              style: AppTextStyles.regular16(
                context,
                color: color,
              )),
        ],
      ),
    );
  }
}
