part of 'month_page_cubit.dart';

@freezed
class MonthPageState with _$MonthPageState {
  const factory MonthPageState.initial({
    @Default([]) List<Event> allEvents,
    @Default(DbStatus.init) DbStatus dbStatus,
  }) = _Initial;
}
