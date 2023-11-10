import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/config/routes/app_routes.dart';
import 'package:planner_app/src/modules/pages/all_events/all_events_page.dart';
import 'package:planner_app/src/modules/pages/day/day_page.dart';
import 'package:planner_app/src/modules/pages/home/home_page.dart';
import 'package:planner_app/src/modules/pages/month/month_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: HomeRoute.page,
          path: AppRoutes.home,
          transitionsBuilder: slideFromTopTransition,
          initial: true,
        ),
        CustomRoute(
          page: DayRoute.page,
          transitionsBuilder: slideFromTopTransition,
          path: AppRoutes.dayView,
          initial: false,
        ),
        CustomRoute(
          page: MonthRoute.page,
          transitionsBuilder: slideFromTopTransition,
          path: AppRoutes.month,
          initial: false,
        ),
        CustomRoute(
          page: AllEventsRoute.page,
          transitionsBuilder: slideFromTopTransition,
          path: AppRoutes.allEvents,
          initial: false,
        ),
      ];
}

Widget slideFromTopTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  const begin = Offset.zero;
  const end = Offset.zero;

  final tween =
      Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
