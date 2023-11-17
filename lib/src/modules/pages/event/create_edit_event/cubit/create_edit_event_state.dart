part of 'create_edit_event_cubit.dart';

@freezed
class CreateEditEventState with _$CreateEditEventState {
  const factory CreateEditEventState.initial({
    @Default('') String eventTitle,
    @Default('') String eventDescription,
    required DateTime eventTime,
    @Default(EventStatus.todo) EventStatus eventStatus,
  }) = _Initial;
}
