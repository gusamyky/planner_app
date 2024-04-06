part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial({
    @Default([]) List<Event> homePageEvents,
    @Default([]) List<Event> foundEvents,
    @Default(DbStatus.init) DbStatus dbStatus,
  }) = _Initial;
}
