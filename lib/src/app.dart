import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbank_test/src/presentation/blocs/heroes_cubit.dart';
import 'package:mbank_test/src/service_locator.dart';

import 'common/style/app_theme.dart';
import 'common/utils/app_router/app_router.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MultiBlocProvider(
          providers: [
            BlocProvider<HeroesCubit>(
              create: (_) => sl<HeroesCubit>(),
            ),
          ],
          child: MaterialApp.router(
            title: 'Test App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routerDelegate: AutoRouterDelegate(_appRouter),
            routeInformationParser: _appRouter.defaultRouteParser(),
          )),
    );
  }
}
