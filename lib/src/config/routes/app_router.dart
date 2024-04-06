import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:planner_app/src/modules/pages/all_events/all_events_page.dart';
import 'package:planner_app/src/modules/pages/all_events/cubit/all_events_cubit.dart';
import 'package:planner_app/src/modules/pages/week/cubit/week_page_cubit.dart';
import 'package:planner_app/src/modules/pages/week/week_page.dart';
import 'package:planner_app/src/modules/pages/event/create_edit_event/create_edit_event.dart';
import 'package:planner_app/src/modules/pages/event/event_info/event_details_page.dart';
import 'package:planner_app/src/modules/pages/home/cubit/home_page_cubit.dart';
import 'package:planner_app/src/modules/pages/home/home_page.dart';
import 'package:planner_app/src/modules/pages/month/cubit/month_page_cubit.dart';
import 'package:planner_app/src/modules/pages/month/month_page.dart';
import 'package:planner_app/src/widgets/main_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true, children: [
          AutoRoute(
            maintainState: false,
            page: HomeRoute.page,
          ),
          AutoRoute(
            maintainState: false,
            page: WeekRoute.page,
          ),
          AutoRoute(
            maintainState: false,
            page: MonthRoute.page,
          ),
          AutoRoute(
            maintainState: false,
            page: AllEventsRoute.page,
          ),
        ]),
        AutoRoute(
          page: EventRoute.page,
        ),
        AutoRoute(
          page: CreateEditEventRoute.page,
        )
      ];
}
