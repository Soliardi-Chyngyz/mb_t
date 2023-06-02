import 'package:auto_route/auto_route.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mbank_test/src/common/style/smooth_border_radius.dart';
import 'package:mbank_test/src/common/utils/app_router/app_router.dart';
import 'package:mbank_test/src/domain/entities/hero_entity.dart';
import 'package:mbank_test/src/presentation/blocs/heroes_cubit.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../common/enums.dart';
import '../../../common/style/app_colors.dart';
import '../../../common/style/app_text_styles.dart';
import '../../../common/utils/bases/base_state.dart';
import '../../widget/custom_rich_text_widget.dart';

class HeroesView extends HookWidget {
  HeroesView({Key? key}) : super(key: key);

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void request(BuildContext context) {
    context.read<HeroesCubit>().getHeroes();
  }

  void _onRefresh(BuildContext context) {
    request(context);
  }

  void _onLoading(BuildContext context) async {
    request(context);
  }

  @override
  Widget build(BuildContext context) {
    final listNotifier = useValueNotifier<List<HeroEntity>>([]);
    final loadingNotifier = useValueNotifier(true);

    useEffect(() {
      request(context);
      return () {
        // _refreshController.dispose();
      };
    });

    return Scaffold(
      body: BlocListener<HeroesCubit, BaseState<List<HeroEntity>>>(
        listener: (context, state) {
          switch (state.status) {
            case CubitStatus.initial:
              loadingNotifier.value = false;
              break;
            case CubitStatus.success:
              loadingNotifier.value = false;
              listNotifier.value = state.entity ?? [];

              _refreshController.refreshCompleted();
              _refreshController.loadComplete();
              break;
            case CubitStatus.error:
              loadingNotifier.value = false;

              _refreshController.refreshCompleted();
              _refreshController.loadComplete();
              break;
            case CubitStatus.loading:
              loadingNotifier.value = true;
              break;
          }
        },
        child: Stack(children: [
          HookBuilder(builder: (ctx) {
            final list = useValueListenable(listNotifier);

            return SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                enablePullUp: true,
                footer: _buildFooter.call(),
                onRefresh: () => _onRefresh(context),
                onLoading: () => _onLoading(context),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: kToolbarHeight),
                  itemBuilder: (ctx, i) => buildItemWidget(ctx, list[i]),
                  itemCount: list.length,
                ));
          }),
          HookBuilder(builder: (ctx) {
            final isLoad = useValueListenable(loadingNotifier);

            return isLoad
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox();
          })
        ]),
      ),
    );
  }

  Widget _buildFooter() => CustomFooter(
        builder: (context, mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text(
              'Pull up to load',
              style: AppTextStyles.regular14(context),
            );
          } else if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text(
              'Load failed',
              style: AppTextStyles.regular14(context),
            );
          } else if (mode == LoadStatus.canLoading) {
            body = Text(
              'Release to load',
              style: AppTextStyles.regular14(context),
            );
          } else {
            body = Text(
              'No data',
              style: AppTextStyles.regular14(context),
            );
          }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      );

  Widget buildItemWidget(BuildContext context, HeroEntity entity) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: ElevatedButton(
          onPressed: () => context.router.push(HeroRoute(entity: entity)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Hero(
                  tag: entity.image.toString(),
                  child: ClipSmoothRect(
                    radius: CustomRadius.left(16),
                    child: FadeInImage.memoryNetwork(
                      width: 100,
                      height: 185,
                      fit: BoxFit.fitHeight,
                      placeholder: kTransparentImage,
                      image: entity.image ?? '',
                      imageErrorBuilder: (_, __, ___) => const SizedBox(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: entity.name.toString(),
                        child: Text(
                          entity.name ?? '',
                          style: AppTextStyles.semiBold21(context),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: entity.status == 'Alive'
                                    ? ColorName.green
                                    : ColorName.red),
                          ),
                          const SizedBox(width: 5),
                          Hero(
                            tag: '${entity.species}${entity.id}',
                            child: Text(
                              '${entity.status} - ${entity.species}',
                              style: AppTextStyles.regular16(context),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomRichTextWidget(
                        title: 'Last known location:',
                        desc: '\n${entity.location?.name}',
                      ),
                      const SizedBox(height: 10),
                      CustomRichTextWidget(
                        title: 'First seen in:',
                        desc: '\n${entity.origin?.name}',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
