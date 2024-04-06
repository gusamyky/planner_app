part of 'month_page_cubit.dart';

@freezed
class MonthPageState with _$MonthPageState {
  const factory MonthPageState.initial({
    @Default([]) List<Event> allEvents,
    @Default([]) List<Event> foundEvents,
    @Default(DbStatus.init) DbStatus dbStatus,
  }) = _Initial;
}
