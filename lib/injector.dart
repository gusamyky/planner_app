import 'package:get_it/get_it.dart';
import 'package:planner_app/src/modules/pages/all_events/cubit/all_events_cubit.dart';
import 'package:planner_app/src/modules/pages/event/create_edit_event/cubit/create_edit_event_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  //_injectConfig();
  //_injectDataSources();
  // _injectRepositories();
  //_injectUseCases();
  _injectBlocs();
}

void _injectBlocs() {
  sl
    ..registerFactory<CreateEditEventCubit>(
      () => CreateEditEventCubit(),
    )
    ..registerFactory<AllEventsCubit>(() => AllEventsCubit());
}
