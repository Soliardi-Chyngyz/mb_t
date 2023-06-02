import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mbank_test/src/presentation/pages/episodes/episodes_view.dart';
import 'package:mbank_test/src/presentation/pages/heroes/heroes_view.dart';

import '../../../domain/entities/hero_entity.dart';
import '../../../presentation/pages/heroes/hero_view.dart';
import '../../../presentation/pages/home/home_view.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(replaceInRouteName: 'View,Route', routes: <AutoRoute>[
  AutoRoute(
    page: HomeView,
    initial: true,
    children: [
      AutoRoute(page: HeroesView),
      AutoRoute(page: EpisodesView),
    ],
  ),
  AutoRoute(page: HeroView),
])
class AppRouter extends _$AppRouter {}
