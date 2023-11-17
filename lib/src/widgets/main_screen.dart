import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/config/routes/app_router.dart';
import 'package:planner_app/src/config/routes/app_routes.dart';
import 'package:planner_app/src/config/styles/app_icons.dart';
import 'package:planner_app/src/config/styles/palette.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [HomeRoute(), DayRoute(), MonthRoute(), AllEventsRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Palette.navBarColor,
            items: _tabs(context),
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
          ),
        );
      },
    );
  }
}

class BNBItem extends BottomNavigationBarItem {
  const BNBItem({
    required this.initialLocation,
    required super.icon,
    required super.activeIcon,
    required super.label,
  });

  final String initialLocation;
}

List<BNBItem> _tabs(BuildContext context) => <BNBItem>[
      BNBItem(
        initialLocation: AppRoutes.home,
        icon: const AppIcon(icon: AppIcons.home),
        activeIcon: const AppIcon(
          icon: AppIcons.home,
          color: Palette.selected,
        ),
        label: AppLocalizations.of(context)!.home,
      ),
      BNBItem(
        initialLocation: AppRoutes.dayView,
        icon: const AppIcon(icon: AppIcons.calendarDay),
        activeIcon: const AppIcon(
          icon: AppIcons.calendarDay,
          color: Palette.selected,
        ),
        label: AppLocalizations.of(context)!.today,
      ),
      BNBItem(
        initialLocation: AppRoutes.month,
        icon: const AppIcon(icon: AppIcons.calendar),
        activeIcon: const AppIcon(
          icon: AppIcons.calendar,
          color: Palette.selected,
        ),
        label: AppLocalizations.of(context)!.month,
      ),
      BNBItem(
        initialLocation: AppRoutes.allEvents,
        icon: const AppIcon(icon: AppIcons.calendar),
        activeIcon: const AppIcon(
          icon: AppIcons.calendar,
          color: Palette.selected,
        ),
        label: AppLocalizations.of(context)!.all_events,
      ),
    ];
