import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/core/services/local_notification_service.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_edit_event_state.dart';
part 'create_edit_event_cubit.freezed.dart';

class CreateEditEventCubit extends Cubit<CreateEditEventState> {
  CreateEditEventCubit()
      : super(CreateEditEventState.initial(
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

  void onInitial(Event? event) async {
    emit(state.copyWith(
      stateStatus: StateStatus.init,
      eventTitle: event?.title ?? state.eventTitle,
      eventDescription: event?.description ?? state.eventDescription,
      eventDate: event?.date ?? state.eventDate,
      eventStatus: event?.status ?? state.eventStatus,
      timeFrom: event?.timeFrom ?? state.timeFrom,
      timeTo: event?.timeTo ?? state.timeTo,
    ));
  }

  void onTitleChanged(String title) => emit(state.copyWith(eventTitle: title));

  void onDescriptionChanged(String description) =>
      emit(state.copyWith(eventDescription: description));

  void onDateChanged(DateTime date) {
    final startTime = DateTime(date.year, date.month, date.day,
        state.timeFrom.hour, state.timeFrom.minute);
    final endTime = DateTime(date.year, date.month, date.day, state.timeTo.hour,
        state.timeTo.minute);
    emit(state.copyWith());
    emit(state.copyWith(eventDate: date, timeFrom: startTime, timeTo: endTime));
  }

  void onTimeChanged(DateTime start, DateTime end) {
    final startTime = DateTime(state.eventDate.year, state.eventDate.month,
        state.eventDate.day, start.hour, start.minute);
    final endTime = DateTime(state.eventDate.year, state.eventDate.month,
        state.eventDate.day, end.hour, end.minute);
    emit(state.copyWith(timeFrom: startTime, timeTo: endTime));
  }

  void onStatusChanged(EventStatus status) =>
      emit(state.copyWith(eventStatus: status));

  void onEditEvent(Event event) async {
    emit(state.copyWith(stateStatus: StateStatus.editing));
    final editedEvent = Event(
      title: state.eventTitle.trim(),
      description: state.eventDescription.trim(),
      status: state.eventStatus,
      date: state.eventDate,
      timeFrom: state.timeFrom,
      timeTo: state.timeTo,
    );
    await IsarService().updateEvent(event.id!, editedEvent);
    scheduleNotificationEdited(editedEvent);
    emit(state.copyWith(stateStatus: StateStatus.edited));
  }

  void onCreateEvent() async {
    emit(state.copyWith(stateStatus: StateStatus.adding));
    final newEvent = Event(
      title: state.eventTitle.trim(),
      description: state.eventDescription.trim(),
      status: state.eventStatus,
      date: state.eventDate,
      timeFrom: state.timeFrom,
      timeTo: state.timeTo,
    );

    await IsarService().addEvent(newEvent);
    scheduleNotification(newEvent);
    emit(state.copyWith(stateStatus: StateStatus.added));
  }

  void scheduleNotificationEdited(Event event) async {
    final id = await IsarService().getEventId(event);
    LocalNotificationService().cancelNotification(id);
    LocalNotificationService().scheduleNotification(
      id: id,
      scheduledNotificationDateTime: event.timeFrom!,
      title: event.title,
      body: event.description,
    );
  }

  void scheduleNotification(Event event) async {
    final id = await IsarService().getEventId(event);
    LocalNotificationService().scheduleNotification(
      id: id,
      scheduledNotificationDateTime: event.timeFrom!,
      title: event.title,
      body: event.description,
    );
  }
}
