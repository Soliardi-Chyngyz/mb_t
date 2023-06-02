import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mbank_test/src/common/style/app_colors.dart';
import 'package:mbank_test/src/core/mixin/time_manager.dart';
import 'package:mbank_test/src/presentation/widget/custom_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/style/app_text_styles.dart';
import '../../../domain/entities/hero_entity.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/custom_rich_text_widget.dart';
import 'package:collection/collection.dart';

class HeroView extends HookWidget with TimeManager {
  const HeroView({Key? key, required this.entity}) : super(key: key);
  final HeroEntity entity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        CustomSliverAppBar(
          title: entity.name,
          tag: entity.image,
          imageUrl: entity.image,
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 20,
              bottom: 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: entity.name.toString(),
                      child: Text(
                        entity.name.toString(),
                        style: AppTextStyles.bold24(context,
                            color: ColorName.black),
                      ),
                    ),
                    Text(
                      formatDateTime(entity.created),
                      style: AppTextStyles.regular14(context,
                          color: ColorName.gray1),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Hero(
                    tag: '${entity.species}${entity.id}',
                    child: Text(
                      '${entity.status} - ${entity.species}',
                    )),
                const SizedBox(height: 20),
                CustomRichTextWidget(
                  title: 'Last known location:',
                  desc: '\n${entity.location?.name}',
                  color: ColorName.black,
                ),
                const SizedBox(height: 20),
                CustomRichTextWidget(
                  title: 'First seen in:',
                  desc: '\n${entity.origin?.name}',
                  color: ColorName.black,
                ),
                Text(
                  'Episodes',
                  style:
                      AppTextStyles.medium18(context, color: ColorName.black),
                ),
                ...?entity.episode
                    ?.mapIndexed((i, e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextButton(
                            onPressed: () => showCustomDialog(
                                context,
                                Column(
                                  children: [
                                    Text(
                                      'There is an idea to send this link, get data, navigate to a new page, but again, I don’t have time. Please be understanding )_',
                                      style: AppTextStyles.medium18(context,
                                          color: ColorName.black),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                height: 200,
                                (p0) => null),
                            // _launchUrl(Uri.parse(e)),
                            child: Text('#${i++} Navigate by click'),
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // ignore: only_throw_errors
      throw 'Could not launch $url';
    }
  }
}
