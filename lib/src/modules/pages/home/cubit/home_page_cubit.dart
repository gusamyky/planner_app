import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/core/services/local_notification_service.dart';
import 'package:planner_app/src/domain/entities/event.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState.initial());

  final isarService = IsarService();

  Future<void> getHomeEvents() async {
    emit(state.copyWith(dbStatus: DbStatus.loading));
    final today = DateTime.now().subtract(const Duration(days: 1));
    final endDate = DateTime.now();
    List<Event> filteredEvents = [];
    final allEvents = await isarService.fetchEvents();

    filteredEvents = allEvents
        .where((element) =>
            element.date!.isAfter(today) && element.date!.isBefore(endDate))
        .toList();

    filteredEvents.sort(
      (a, b) => a.date!.compareTo(b.date!),
    );

    emit(state.copyWith(
        homePageEvents: filteredEvents, dbStatus: DbStatus.loaded));
  }

  void search(String text) {
    emit(state.copyWith(dbStatus: DbStatus.searching));
    log(text);
    final foundEvents = <Event>[];
    if (text.trim().isNotEmpty) {
      for (final event in state.homePageEvents) {
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

  Future<void> deleteEvent(Event event) async {
    log('delete');
    await isarService.deleteEvent(event);
    LocalNotificationService().cancelNotification(event.id!);
    getHomeEvents();
  }
}
