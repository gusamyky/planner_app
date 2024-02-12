part of 'all_events_cubit.dart';

@freezed
class AllEventsState with _$AllEventsState {
  const factory AllEventsState.initial({
    @Default([]) List<Event> allEvents,
    @Default(DbStatus.init) DbStatus dbStatus,
    @Default([]) List<Event> foundEvents,
  }) = _Initial;
}
