import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/src/modules/pages/all_events/cubit/all_events_cubit.dart';
import 'package:planner_app/src/modules/pages/home/cubit/home_page_cubit.dart';

part 'create_edit_event_state.dart';
part 'create_edit_event_cubit.freezed.dart';

class CreateEditEventCubit extends Cubit<CreateEditEventState> {
  CreateEditEventCubit({
    required this.allEventsCubit,
    required this.homePageCubit,
  }) : super(CreateEditEventState.initial(
          eventDate: DateTime.now(),
          timeFrom: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              DateTime.now().hour,
              (DateTime.now().minute - (DateTime.now().minute % 5)).toInt()),
          timeTo: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              DateTime.now().hour,
              (DateTime.now().minute - (DateTime.now().minute % 5)).toInt()),
        ));

  final AllEventsCubit allEventsCubit;
  final HomePageCubit homePageCubit;

  void onTitleChanged(String title) => emit(state.copyWith(eventTitle: title));

  void onDescriptionChanged(String description) =>
      emit(state.copyWith(eventDescription: description));

  void onDateChanged(DateTime date) => emit(state.copyWith(eventDate: date));

  void onTimeChanged(DateTime start, DateTime end) {
    final startTime = DateTime(state.eventDate.year, state.eventDate.month,
        state.eventDate.day, start.hour, start.minute);
    final endTime = DateTime(state.eventDate.year, state.eventDate.month,
        state.eventDate.day, end.hour, end.minute);
    emit(state.copyWith(timeFrom: startTime, timeTo: endTime));
  }

  void onStatusChanged(EventStatus status) =>
      emit(state.copyWith(eventStatus: status));

  void onCreateEvent() async {
    emit(state.copyWith(dbStatus: DbStatus.adding));
    final newEvent = Event(
      title: state.eventTitle,
      description: state.eventDescription,
      status: state.eventStatus,
      date: state.timeFrom,
      timeFrom: state.timeFrom,
      timeTo: state.timeTo,
    );
    await IsarService()
        .addEvent(newEvent)
        .then((value) => emit(state.copyWith(dbStatus: DbStatus.added)));
  }

  void updateStates() {
    allEventsCubit.getAllEvents();
    homePageCubit.getHomeEvents();
  }
}
