part of 'day_page_cubit.dart';

@freezed
class DayPageState with _$DayPageState {
  const factory DayPageState.initial({
    @Default([]) List<Event> dayEvents,
    @Default([]) List<Event> foundEvents,
    @Default(DbStatus.init) DbStatus dbStatus,
  }) = _Initial;
}
