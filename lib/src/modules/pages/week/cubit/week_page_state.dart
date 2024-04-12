part of 'week_page_cubit.dart';

@freezed
class WeekPageState with _$WeekPageState {
  const factory WeekPageState.initial({
    @Default([]) List<Event> weekEvents,
    @Default([]) List<Event> foundEvents,
    @Default(StateStatus.init) StateStatus stateStatus,
  }) = _Initial;
}
