// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AllEventsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllEventsPage(),
      );
    },
    DayRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DayPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MonthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MonthPage(),
      );
    },
  };
}

/// generated route for
/// [AllEventsPage]
class AllEventsRoute extends PageRouteInfo<void> {
  const AllEventsRoute({List<PageRouteInfo>? children})
      : super(
          AllEventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllEventsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DayPage]
class DayRoute extends PageRouteInfo<void> {
  const DayRoute({List<PageRouteInfo>? children})
      : super(
          DayRoute.name,
          initialChildren: children,
        );

  static const String name = 'DayRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MonthPage]
class MonthRoute extends PageRouteInfo<void> {
  const MonthRoute({List<PageRouteInfo>? children})
      : super(
          MonthRoute.name,
          initialChildren: children,
        );

  static const String name = 'MonthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
