part of 'all_events_cubit.dart';

@freezed
class AllEventsState with _$AllEventsState {
  const factory AllEventsState.initial({
    @Default([]) List<Event> allEvents,
    @Default(StateStatus.init) StateStatus stateStatus,
    @Default([]) List<Event> foundEvents,
  }) = _Initial;
}
