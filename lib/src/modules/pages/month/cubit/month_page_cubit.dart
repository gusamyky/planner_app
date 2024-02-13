import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/domain/entities/event.dart';

part 'month_page_state.dart';
part 'month_page_cubit.freezed.dart';

class MonthPageCubit extends Cubit<MonthPageState> {
  MonthPageCubit() : super(const MonthPageState.initial());

  final isarService = IsarService();

  Future<void> getMonthEvents() async {
    emit(state.copyWith(dbStatus: DbStatus.loading));
    List<Event> filteredEvents = [];
    final allEvents = await isarService.fetchEvents();

    filteredEvents = allEvents
        .where((event) => event.date!.month == DateTime.now().month)
        .toList();

    emit(state.copyWith(allEvents: filteredEvents, dbStatus: DbStatus.loaded));
  }

  Future<void> deleteEvent(Event event) async {
    await isarService.deleteEvent(event);
    getMonthEvents();
  }

  void search(String text) {
    emit(state.copyWith(dbStatus: DbStatus.searching));
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
            dbStatus:
                foundEvents.isNotEmpty ? DbStatus.found : DbStatus.notFound));
      }
    } else {
      emit(state.copyWith(dbStatus: DbStatus.loaded));
    }
    log(state.dbStatus.toString());
  }
}
