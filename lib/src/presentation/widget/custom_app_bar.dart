import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../common/style/app_colors.dart';
import '../../common/style/app_text_styles.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    required this.imageUrl,
    this.title,
    this.tag,
  }) : super(key: key);
  final String? imageUrl;
  final String? title;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorName.white,
      stretch: true,
      pinned: true,
      leading: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          )),
      expandedHeight: 200,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        return FlexibleSpaceBar(
          expandedTitleScale: 1,
          stretchModes: const [StretchMode.zoomBackground],
          centerTitle: true,
          title: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            alignment: constraints.maxHeight < 110
                ? Alignment.bottomCenter
                : Alignment.bottomLeft,
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Text(
              title ?? '',
              maxLines: 1,
              textAlign: constraints.maxHeight < 110
                  ? TextAlign.center
                  : TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.semiBold18(context,
                  color: constraints.maxHeight > 110
                      ? Colors.white
                      : Colors.black),
            ),
          ),
          background: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0, 1],
                ),
              ),
              child: imageUrl != null
                  ? Hero(
                      tag: tag ?? imageUrl!,
                      child: FadeInImage.memoryNetwork(
                        fit: BoxFit.cover,
                        placeholder: kTransparentImage,
                        image: imageUrl!,
                      ),
                    )
                  : const SizedBox()),
        );
      }),
    );
  }
}
