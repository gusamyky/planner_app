import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/config/routes/app_routes.dart';
import 'package:planner_app/src/config/styles/app_colors.dart';
import 'package:planner_app/src/config/styles/app_icons.dart';
import 'package:planner_app/src/config/styles/palette.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key,
      required this.body,
      this.appBarTitle,
      this.withPadding = true});

  final Widget body;
  final bool withPadding;
  final String? appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palette.navBarColor,
        actions: [
          InkWell(
              onTap: () {},
              child: const CircleAvatar(
                  backgroundColor: AppColors.gray,
                  child: AppIcon(icon: AppIcons.search))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Constants.space11),
            child: InkWell(
                onTap: () {},
                child: const CircleAvatar(
                    backgroundColor: AppColors.gray,
                    child: AppIcon(icon: AppIcons.plus))),
          ),
        ],
        title: appBarTitle != null
            ? Text(
                appBarTitle!,
                style: Theme.of(context).textTheme.headlineLarge,
              )
            : null,
      ),
      backgroundColor: Palette.backgroundColor,
      body: withPadding
          ? Padding(
              padding: const EdgeInsets.all(Constants.appPadding),
              child: body,
            )
          : body,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Palette.navBarColor,
        items: _tabs(context),
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) =>
            context.router.replaceNamed(_tabs(context)[index].initialLocation),
      ),
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

int _calculateSelectedIndex(BuildContext context) {
  final location = context.router.current.path;
  final index = _tabs(context).indexWhere(
    (t) => location.startsWith(t.initialLocation),
  );
  return index < 0 ? 0 : index;
}
