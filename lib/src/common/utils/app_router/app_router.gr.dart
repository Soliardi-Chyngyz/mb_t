// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    HeroRoute.name: (routeData) {
      final args = routeData.argsAs<HeroRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: HeroView(
          key: args.key,
          entity: args.entity,
        ),
      );
    },
    HeroesRoute.name: (routeData) {
      final args = routeData.argsAs<HeroesRouteArgs>(
          orElse: () => const HeroesRouteArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: HeroesView(key: args.key),
      );
    },
    EpisodesRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EpisodesView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            RouteConfig(
              HeroesRoute.name,
              path: 'heroes-view',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              EpisodesRoute.name,
              path: 'episodes-view',
              parent: HomeRoute.name,
            ),
          ],
        ),
        RouteConfig(
          HeroRoute.name,
          path: '/hero-view',
        ),
      ];
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [HeroView]
class HeroRoute extends PageRouteInfo<HeroRouteArgs> {
  HeroRoute({
    Key? key,
    required HeroEntity entity,
  }) : super(
          HeroRoute.name,
          path: '/hero-view',
          args: HeroRouteArgs(
            key: key,
            entity: entity,
          ),
        );

  static const String name = 'HeroRoute';
}

class HeroRouteArgs {
  const HeroRouteArgs({
    this.key,
    required this.entity,
  });

  final Key? key;

  final HeroEntity entity;

  @override
  String toString() {
    return 'HeroRouteArgs{key: $key, entity: $entity}';
  }
}

/// generated route for
/// [HeroesView]
class HeroesRoute extends PageRouteInfo<HeroesRouteArgs> {
  HeroesRoute({Key? key})
      : super(
          HeroesRoute.name,
          path: 'heroes-view',
          args: HeroesRouteArgs(key: key),
        );

  static const String name = 'HeroesRoute';
}

class HeroesRouteArgs {
  const HeroesRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HeroesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [EpisodesView]
class EpisodesRoute extends PageRouteInfo<void> {
  const EpisodesRoute()
      : super(
          EpisodesRoute.name,
          path: 'episodes-view',
        );

  static const String name = 'EpisodesRoute';
}
