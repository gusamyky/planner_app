import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/domain/entities/event.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState.initial());

  final isarService = IsarService();

  Future<void> getHomeEvents() async {
    emit(state.copyWith(dbStatus: DbStatus.loading));
    DateTime today = DateTime.now().subtract(const Duration(days: 1));
    final endDate = today.add(const Duration(days: 2));
    List<Event> filteredEvents = [];
    final allEvents = await isarService.fetchEvents();

    filteredEvents = allEvents
        .where((element) =>
            element.date!.isAfter(today) && element.date!.isBefore(endDate))
        .toList();

    filteredEvents.sort(
      (a, b) => a.timeFrom!.compareTo(b.timeFrom!),
    );

    emit(state.copyWith(
        homePageEvents: filteredEvents, dbStatus: DbStatus.loaded));

    log('home events');
  }

  Future<void> deleteEvent(Event event) async {
    await isarService.deleteEvent(event);
    getHomeEvents();
  }
}
