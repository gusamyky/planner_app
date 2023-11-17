import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_edit_event_state.dart';
part 'create_edit_event_cubit.freezed.dart';

class CreateEditEventCubit extends Cubit<CreateEditEventState> {
  CreateEditEventCubit()
      : super(CreateEditEventState.initial(eventTime: DateTime.now()));

  void onTitleChanged(String title) => emit(state.copyWith(eventTitle: title));

  void onDescriptionChanged(String description) =>
      emit(state.copyWith(eventDescription: description));

  void onDateChanged(DateTime date) => emit(state.copyWith(eventTime: date));

  void onStatusChanged(EventStatus status) =>
      emit(state.copyWith(eventStatus: status));
}
