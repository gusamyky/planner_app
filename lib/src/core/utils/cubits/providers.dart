import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/modules/cubits/cubit/main_cubit.dart';
import 'package:planner_app/src/modules/pages/all_events/cubit/all_events_cubit.dart';
import 'package:planner_app/src/modules/pages/week/cubit/week_page_cubit.dart';
import 'package:planner_app/src/modules/pages/event/create_edit_event/cubit/create_edit_event_cubit.dart';
import 'package:planner_app/src/modules/pages/home/cubit/home_page_cubit.dart';
import 'package:planner_app/src/modules/pages/month/cubit/month_page_cubit.dart';

class Providers {
  static List<BlocProvider> common = [
    BlocProvider<CreateEditEventCubit>(
        create: (_) => sl<CreateEditEventCubit>()),
    BlocProvider<HomePageCubit>(create: (_) => sl<HomePageCubit>()),
    BlocProvider<AllEventsCubit>(create: (_) => sl<AllEventsCubit>()),
    BlocProvider<WeekPageCubit>(create: (_) => sl<WeekPageCubit>()),
    BlocProvider<MonthPageCubit>(create: (_) => sl<MonthPageCubit>()),
    BlocProvider<MainCubit>(create: (_) => sl<MainCubit>()),
  ];
}
