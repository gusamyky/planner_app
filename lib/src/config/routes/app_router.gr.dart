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
    CreateEditEventRoute.name: (routeData) {
      final args = routeData.argsAs<CreateEditEventRouteArgs>(
          orElse: () => const CreateEditEventRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateEditEventPage(
          allEventsCubit: args.allEventsCubit,
          event: args.event,
          homePageCubit: args.homePageCubit,
          weekPageCubit: args.weekPageCubit,
          monthPageCubit: args.monthPageCubit,
          key: args.key,
        ),
      );
    },
    EventRoute.name: (routeData) {
      final args = routeData.argsAs<EventRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EventPage(
          event: args.event,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    MonthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MonthPage(),
      );
    },
    WeekRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WeekPage(),
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
/// [CreateEditEventPage]
class CreateEditEventRoute extends PageRouteInfo<CreateEditEventRouteArgs> {
  CreateEditEventRoute({
    AllEventsCubit? allEventsCubit,
    Event? event,
    HomePageCubit? homePageCubit,
    WeekPageCubit? weekPageCubit,
    MonthPageCubit? monthPageCubit,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CreateEditEventRoute.name,
          args: CreateEditEventRouteArgs(
            allEventsCubit: allEventsCubit,
            event: event,
            homePageCubit: homePageCubit,
            weekPageCubit: weekPageCubit,
            monthPageCubit: monthPageCubit,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateEditEventRoute';

  static const PageInfo<CreateEditEventRouteArgs> page =
      PageInfo<CreateEditEventRouteArgs>(name);
}

class CreateEditEventRouteArgs {
  const CreateEditEventRouteArgs({
    this.allEventsCubit,
    this.event,
    this.homePageCubit,
    this.weekPageCubit,
    this.monthPageCubit,
    this.key,
  });

  final AllEventsCubit? allEventsCubit;

  final Event? event;

  final HomePageCubit? homePageCubit;

  final WeekPageCubit? weekPageCubit;

  final MonthPageCubit? monthPageCubit;

  final Key? key;

  @override
  String toString() {
    return 'CreateEditEventRouteArgs{allEventsCubit: $allEventsCubit, event: $event, homePageCubit: $homePageCubit, weekPageCubit: $weekPageCubit, monthPageCubit: $monthPageCubit, key: $key}';
  }
}

/// generated route for
/// [EventPage]
class EventRoute extends PageRouteInfo<EventRouteArgs> {
  EventRoute({
    required Event event,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EventRoute.name,
          args: EventRouteArgs(
            event: event,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EventRoute';

  static const PageInfo<EventRouteArgs> page = PageInfo<EventRouteArgs>(name);
}

class EventRouteArgs {
  const EventRouteArgs({
    required this.event,
    this.key,
  });

  final Event event;

  final Key? key;

  @override
  String toString() {
    return 'EventRouteArgs{event: $event, key: $key}';
  }
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
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

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

/// generated route for
/// [WeekPage]
class WeekRoute extends PageRouteInfo<void> {
  const WeekRoute({List<PageRouteInfo>? children})
      : super(
          WeekRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeekRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
