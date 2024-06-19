import 'package:get_it/get_it.dart';
import 'package:planner_app/src/modules/cubits/cubit/main_cubit.dart';
import 'package:planner_app/src/modules/pages/all_events/cubit/all_events_cubit.dart';
import 'package:planner_app/src/modules/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:planner_app/src/modules/pages/week/cubit/week_page_cubit.dart';
import 'package:planner_app/src/modules/pages/event/create_edit_event/cubit/create_edit_event_cubit.dart';
import 'package:planner_app/src/modules/pages/home/cubit/home_page_cubit.dart';
import 'package:planner_app/src/modules/pages/month/cubit/month_page_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  // _injectConfig();
  //_injectDataSources();
  // _injectRepositories();
  //_injectUseCases();
  _injectBlocs();
}

// void _injectConfig() {
//   sl.registerLazySingleton<LocalNotificationService>(
//       () => LocalNotificationService());
// }

void _injectBlocs() {
  sl
    ..registerFactory<CreateEditEventCubit>(() => CreateEditEventCubit())
    ..registerFactory<SignUpCubit>(() => SignUpCubit())
    ..registerFactory<AllEventsCubit>(() => AllEventsCubit())
    ..registerFactory<HomePageCubit>(() => HomePageCubit())
    ..registerFactory<WeekPageCubit>(() => WeekPageCubit())
    ..registerFactory<MonthPageCubit>(() => MonthPageCubit())
    ..registerFactory<MainCubit>(() => MainCubit());
}
