import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/core/services/local_notification_service.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';

part 'week_page_state.dart';
part 'week_page_cubit.freezed.dart';

class WeekPageCubit extends Cubit<WeekPageState> {
  WeekPageCubit() : super(const WeekPageState.initial());

  final isarService = IsarService();

  Future<void> getWeekEvents() async {
    emit(state.copyWith(stateStatus: StateStatus.loading));

    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    List<Event> filteredEvents = [];
    final allEvents = await isarService.fetchEvents();

    filteredEvents = allEvents
        .where((element) =>
            element.date!.isAfter(startOfWeek) &&
            element.date!.isBefore(endOfWeek))
        .toList();

    filteredEvents.sort(
      (a, b) => a.timeFrom!.millisecondsSinceEpoch
          .compareTo(b.timeFrom!.millisecondsSinceEpoch),
    );

    emit(state.copyWith(
        weekEvents: filteredEvents, stateStatus: StateStatus.loaded));
  }

  void search(String text) {
    emit(state.copyWith(stateStatus: StateStatus.searching));
    log(text);
    final foundEvents = <Event>[];
    if (text.trim().isNotEmpty) {
      for (final event in state.weekEvents) {
        if (event.description!.toLowerCase().contains(text) ||
            event.title!.toLowerCase().contains(text)) {
          foundEvents.add(event);
        }
        emit(state.copyWith(
            foundEvents: foundEvents,
            stateStatus: foundEvents.isNotEmpty
                ? StateStatus.found
                : StateStatus.notFound));
      }
    } else {
      emit(state.copyWith(stateStatus: StateStatus.loaded));
    }
    log(state.stateStatus.toString());
  }

  Future<void> deleteEvent(Event event) async {
    await isarService.deleteEvent(event);
    LocalNotificationService().cancelNotification(event.id!);
    getWeekEvents();
  }
}
