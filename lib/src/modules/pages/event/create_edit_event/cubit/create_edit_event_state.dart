part of 'create_edit_event_cubit.dart';

@freezed
class CreateEditEventState with _$CreateEditEventState {
  const factory CreateEditEventState.initial({
    @Default('') String eventTitle,
    @Default('') String eventDescription,
    required DateTime eventDate,
    required DateTime timeFrom,
    required DateTime timeTo,
    @Default(EventStatus.todo) EventStatus eventStatus,
    @Default(StateStatus.loading) StateStatus stateStatus,
  }) = _Initial;
}
