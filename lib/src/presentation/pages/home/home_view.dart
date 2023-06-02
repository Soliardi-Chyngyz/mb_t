import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbank_test/src/common/style/app_text_styles.dart';
import 'package:mbank_test/src/common/utils/app_router/app_router.dart';

import '../../../common/api/internter_connectivity.dart';
import '../../../common/style/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const String routeName = 'home/';

  @override
  State<HomeView> createState() => _HomeViewState();
}

final globalHomeKey = GlobalKey();

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  /// check internet
  Map _source = {ConnectivityResult.none: false};
  final _connectivity = InternetConnectivity.instance;

  @override
  void initState() {
    super.initState();

    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      if (mounted) {
        setState(() => _source = source);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsRouter(
        routes: [
          HeroesRoute(),
          const EpisodesRoute(),
        ],
        builder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);

          return Stack(children: [
            Scaffold(
              extendBody: true,
              backgroundColor: ColorName.transparent,
              body: FadeTransition(
                opacity: animation,
                child: child,
              ),
              bottomNavigationBar: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 1.2,
                    // left: 1.2,
                    // right: 1.2,
                  ),
                  decoration: const ShapeDecoration(
                    color: Color(0xFFB6B6B6),
                    shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius.vertical(
                      top: SmoothRadius(
                        cornerRadius: 20,
                        cornerSmoothing: 1,
                      ),
                    )),
                  ),
                  child: ClipSmoothRect(
                    radius: const SmoothBorderRadius.vertical(
                      top: SmoothRadius(
                        cornerRadius: 20.2,
                        cornerSmoothing: 0.8,
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      color: ColorName.white,
                      child: BottomNavigationBar(
                        key: globalHomeKey,
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: ColorName.white,
                        showSelectedLabels: true,
                        unselectedFontSize: 12,
                        selectedFontSize: 12,
                        showUnselectedLabels: true,
                        currentIndex: tabsRouter.activeIndex,
                        onTap: (i) {
                          tabsRouter.setActiveIndex(i);
                          onTap(i);
                        },
                        selectedLabelStyle: const TextStyle(
                          color: ColorName.main,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          color: ColorName.gray3,
                        ),
                        selectedItemColor: ColorName.main,
                        unselectedItemColor: ColorName.gray3,
                        items: [
                          BottomNavigationBarItem(
                            icon: _buildActiveIcon(
                              child: const FaIcon(FontAwesomeIcons.person),
                            ),
                            label: 'Heroes',
                          ),
                          BottomNavigationBarItem(
                            icon: _buildActiveIcon(
                              child: const FaIcon(FontAwesomeIcons.amilia),
                            ),
                            label: 'Episodes',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (!hasInternet()) buildNoInternet()
          ]);
        },
      ),
    );
  }

  Widget _buildActiveIcon({required Widget child}) {
    return SizedBox(
      width: 29,
      height: 28,
      child: Center(child: child),
    );
  }

  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  bool hasInternet() {
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
        return true;
      case ConnectivityResult.wifi:
        return true;
      case ConnectivityResult.none:
        return false;
      default:
        return true;
    }
  }

  Widget buildNoInternet() => FutureBuilder<bool>(
      future: Future.delayed(const Duration(milliseconds: 1500), () => true),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: ColorName.gray3,
            child: Center(
              child: Text(
                'No Internet',
                style: AppTextStyles.bold32(context),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      });
}
