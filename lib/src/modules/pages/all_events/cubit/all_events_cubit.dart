import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/core/services/local_notification_service.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';

part 'all_events_state.dart';
part 'all_events_cubit.freezed.dart';

class AllEventsCubit extends Cubit<AllEventsState> {
  AllEventsCubit() : super(const AllEventsState.initial());

  final isarService = IsarService();

  Future<void> getAllEvents() async {
    emit(state.copyWith(stateStatus: StateStatus.loading));
    final allEvents = await isarService.fetchEvents();
    allEvents.sort(
      (a, b) => a.timeFrom!.millisecondsSinceEpoch
          .compareTo(b.timeFrom!.millisecondsSinceEpoch),
    );
    emit(state.copyWith(allEvents: allEvents, stateStatus: StateStatus.loaded));
  }

  Future<void> deleteEvent(Event event) async {
    await isarService.deleteEvent(event);
    LocalNotificationService().cancelNotification(event.id!);
    getAllEvents();
  }

  void search(String text) {
    emit(state.copyWith(stateStatus: StateStatus.searching));
    log(text);
    final foundEvents = <Event>[];
    if (text.trim().isNotEmpty) {
      for (final event in state.allEvents) {
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
}
