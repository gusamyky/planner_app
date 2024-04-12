import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';

part 'main_state.dart';
part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial());

  final isar = IsarService();

  void toggleSearchStatus() {
    emit(state.copyWith(
      isSearchActive: !state.isSearchActive,
    ));

    getAllEvents();
  }

  Future<void> getAllEvents() async {
    emit(state.copyWith(stateStatus: StateStatus.loading));
    await isar.fetchEvents().then((allEvents) {
      allEvents.sort(
        (a, b) => a.timeFrom!.compareTo(b.timeFrom!),
      );
      emit(state.copyWith(
          allEvents: allEvents, stateStatus: StateStatus.loaded));
    });
  }

  Future<void> getMonthEvents() async {
    emit(state.copyWith(stateStatus: StateStatus.loading));
    List<Event> filteredEvents = [];
    final allEvents = await isar.fetchEvents();

    filteredEvents = allEvents
        .where((event) => event.date!.month == DateTime.now().month)
        .toList();

    emit(state.copyWith(
        allEvents: filteredEvents, stateStatus: StateStatus.loaded));
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
