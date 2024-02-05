import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/src/config/routes/app_router.dart';
import 'package:planner_app/src/config/styles/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/core/utils/cubits/providers.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...Providers.common],
      child: MaterialApp.router(
        routerDelegate: AutoRouterDelegate(
          _appRouter,
          navigatorObservers: () => [AutoRouteObserver()],
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: AppTheme.dark,
        darkTheme: AppTheme.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
