import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/src/config/routes/app_router.dart';
import 'package:planner_app/src/config/styles/app_colors.dart';
import 'package:planner_app/src/config/styles/app_icons.dart';
import 'package:planner_app/src/config/styles/palette.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/modules/cubits/cubit/main_cubit.dart';
import 'package:planner_app/src/modules/pages/all_events/cubit/all_events_cubit.dart';
import 'package:planner_app/src/modules/pages/day/cubit/day_page_cubit.dart';
import 'package:planner_app/src/modules/pages/home/cubit/home_page_cubit.dart';
import 'package:planner_app/src/modules/pages/month/cubit/month_page_cubit.dart';

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
        actions: context.router.canPop()
            ? null
            : [
                InkWell(
                    onTap: () {
                      context.read<MainCubit>().toggleSearchStatus();
                    },
                    child: const CircleAvatar(
                        backgroundColor: AppColors.gray,
                        child: AppIcon(icon: AppIcons.search))),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Constants.space11),
                  child: InkWell(
                      onTap: () {
                        context.router.push(CreateEditEventRoute(
                          allEventsCubit: context.read<AllEventsCubit>(),
                          homePageCubit: context.read<HomePageCubit>(),
                          dayPageCubit: context.read<DayPageCubit>(),
                          monthPageCubit: context.read<MonthPageCubit>(),
                        ));
                      },
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
