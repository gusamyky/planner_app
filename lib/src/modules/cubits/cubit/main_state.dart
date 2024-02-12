part of 'main_cubit.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial(
      {@Default(false) bool isSearchActive,
      @Default([]) List<Event> allEvents,
      @Default([]) List<Event> foundEvents,
      @Default(DbStatus.init) DbStatus dbStatus}) = _Initial;
}
