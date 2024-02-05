import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/domain/entities/event.dart';

part 'all_events_state.dart';
part 'all_events_cubit.freezed.dart';

class AllEventsCubit extends Cubit<AllEventsState> {
  AllEventsCubit() : super(const AllEventsState.initial());

  final isarService = IsarService();

  Future<void> getAllEvents() async {
    emit(state.copyWith(dbStatus: DbStatus.loading));
    await isarService.fetchEvents().then((allEvents) {
      allEvents.sort(
        (a, b) => a.timeFrom!.compareTo(b.timeFrom!),
      );
      emit(state.copyWith(allEvents: allEvents, dbStatus: DbStatus.loaded));
    });
  }

  Future<void> deleteEvent(Event event) async {
    await isarService.deleteEvent(event);
    getAllEvents();
  }
}
