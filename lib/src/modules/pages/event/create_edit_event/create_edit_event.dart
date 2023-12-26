import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/config/styles/app_colors.dart';
import 'package:planner_app/src/config/styles/palette.dart';
import 'package:planner_app/src/core/helpers/date_time_extensions.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/modules/pages/event/create_edit_event/cubit/create_edit_event_cubit.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';
import 'package:planner_app/src/widgets/custom_text_field.dart';
import 'package:planner_app/src/widgets/time_range_picker.dart';

@RoutePage()
class CreateEditEventPage extends StatelessWidget {
  const CreateEditEventPage({this.event, super.key});
  final Event? event;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateEditEventCubit>(
      create: (context) => sl<CreateEditEventCubit>(),
      child: BlocBuilder<CreateEditEventCubit, CreateEditEventState>(
        builder: (context, state) {
          return CustomScaffold(
            appBarTitle: event == null
                ? AppLocalizations.of(context)!.create_event
                : AppLocalizations.of(context)!.edit_event,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: Constants.padding15),
                  CustomTextField(
                    maxLines: 1,
                    text: event?.title,
                    isTitle: true,
                    onChanged: (title) => context
                        .read<CreateEditEventCubit>()
                        .onTitleChanged(title),
                  ),
                  const SizedBox(height: Constants.space20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: Constants.padding15),
                  CustomTextField(
                    maxLines: 8,
                    text: event?.description,
                    onChanged: (description) => context
                        .read<CreateEditEventCubit>()
                        .onDescriptionChanged(description),
                  ),
                  const SizedBox(height: Constants.padding20),
                  _DateIndicator(event: event),
                  const SizedBox(height: Constants.padding20),
                  _TimeRangePicker(
                    timeFrom: state.timeFrom,
                    timeTo: state.timeTo,
                  ),
                  //const _TimeIndicator(),
                  const SizedBox(height: Constants.padding20),
                  _StatusPicker(
                    currentStatus: event?.status ?? EventStatus.todo,
                  ),
                  const SizedBox(height: Constants.padding20),
                  _SaveEditButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
          horizontal: Constants.padding10, vertical: Constants.padding15),
      decoration: BoxDecoration(
          color: Palette.navBarColor,
          borderRadius: BorderRadius.circular(Constants.radius15)),
      child: Text(description),
    );
  }
}

class _StatusIndicator extends StatelessWidget {
  const _StatusIndicator({
    required this.status,
  });

  final EventStatus status;

  @override
  Widget build(BuildContext context) {
    final statusStr = status == EventStatus.todo
        ? AppLocalizations.of(context)!.to_do
        : status == EventStatus.done
            ? AppLocalizations.of(context)!.done
            : status == EventStatus.inProgress
                ? AppLocalizations.of(context)!.in_progress
                : AppLocalizations.of(context)!.story;
    return Container(
      padding: const EdgeInsets.all(Constants.padding7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.radius12),
          color: status == EventStatus.todo
              ? Palette.toDoColor
              : status == EventStatus.done
                  ? Palette.doneColor
                  : status == EventStatus.inProgress
                      ? Palette.inProgressColor
                      : Palette.storyColor),
      child: Text(
        statusStr,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class _DateIndicator extends StatelessWidget {
  const _DateIndicator({this.event});
  final Event? event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constants.padding15),
            color: Palette.tileColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(Constants.space8),
            child: Text(event == null
                ? context.read<CreateEditEventCubit>().state.eventDate.yMd
                : event!.date.yMd),
          )),
      onTap: () async {
        final result = await showDatePicker(
          builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                  colorScheme: const ColorScheme.dark(
                      primary: Palette.selected,
                      onPrimary: Palette.backgroundColor,
                      surface: AppColors.gray2,
                      onSurface: AppColors.lightgray),
                  dialogBackgroundColor: AppColors.black),
              child: child!),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          context: context,
          initialDate: event != null ? event!.date : DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        if (result != null && context.mounted) {
          context.read<CreateEditEventCubit>().onDateChanged(result);
        }
      },
    );
  }
}

class _TimeIndicator extends StatelessWidget {
  const _TimeIndicator({this.event, super.key});
  final Event? event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEditEventCubit, CreateEditEventState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            await TimeRangePickerWidget.show(
              context: context,
              initialStartTime: event != null
                  ? event!.timeFrom
                  : context.read<CreateEditEventCubit>().state.timeFrom,
              initialEndTime: event != null
                  ? event!.timeTo
                  : context.read<CreateEditEventCubit>().state.timeTo,
              onStartTimeChanged: (timeFrom) {},
              onEndTimeChanged: (timeTo) {},
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _TimePicker(
                  time: event != null
                      ? event!.timeFrom
                      : context.read<CreateEditEventCubit>().state.timeFrom),
              const SizedBox(width: Constants.space5),
              const Text('-'),
              const SizedBox(width: Constants.space5),
              _TimePicker(
                  time: event != null
                      ? event!.timeTo
                      : context.read<CreateEditEventCubit>().state.timeTo)
            ],
          ),
        );
      },
    );
  }
}

class _TimePicker extends StatelessWidget {
  const _TimePicker({this.time, super.key});
  final DateTime? time;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.padding15),
          color: Palette.tileColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(Constants.space8),
          child: Text(time == null ? DateTime.now().hm : time!.hm),
        ));
  }
}

class _StatusPicker extends StatefulWidget {
  const _StatusPicker({this.currentStatus = EventStatus.todo, super.key});
  final EventStatus? currentStatus;

  @override
  State<_StatusPicker> createState() => _StatusPickerState();
}

class _StatusPickerState extends State<_StatusPicker> {
  @override
  Widget build(BuildContext context) {
    final entries = <DropdownMenuEntry>[
      DropdownMenuEntry(
        value: EventStatus.todo,
        label: AppLocalizations.of(context)!.to_do,
      ),
      DropdownMenuEntry(
        value: EventStatus.inProgress,
        label: AppLocalizations.of(context)!.in_progress,
      ),
      DropdownMenuEntry(
        value: EventStatus.done,
        label: AppLocalizations.of(context)!.done,
      ),
      DropdownMenuEntry(
        value: EventStatus.story,
        label: AppLocalizations.of(context)!.story,
      ),
    ];
    return DropdownMenu(
      initialSelection:
          entries.where((element) => element.value == widget.currentStatus),
      dropdownMenuEntries: entries,
      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: context.read<CreateEditEventCubit>().state.eventStatus ==
                  EventStatus.todo
              ? Palette.toDoColor
              : context.read<CreateEditEventCubit>().state.eventStatus ==
                      EventStatus.done
                  ? Palette.doneColor
                  : context.read<CreateEditEventCubit>().state.eventStatus ==
                          EventStatus.inProgress
                      ? Palette.inProgressColor
                      : Palette.storyColor),
      onSelected: (value) =>
          context.read<CreateEditEventCubit>().onStatusChanged(value),
    );
  }
}

class _SaveEditButton extends StatelessWidget {
  const _SaveEditButton({this.isEditing = false, super.key});
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => context.read<CreateEditEventCubit>().onCreateEvent(),
        child: Text(isEditing
            ? AppLocalizations.of(context)!.edit
            : AppLocalizations.of(context)!.create));
  }
}

class _TimeRangePicker extends StatefulWidget {
  const _TimeRangePicker({required this.timeFrom, required this.timeTo});

  final DateTime timeFrom;
  final DateTime timeTo;

  @override
  State<_TimeRangePicker> createState() => _TimeRangePickerState();
}

class _TimeRangePickerState extends State<_TimeRangePicker> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.text = '${widget.timeFrom.hm} - ${widget.timeTo.hm}';
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.3,
      ),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: () async {
          var start = context.read<CreateEditEventCubit>().state.timeFrom;
          var end = context.read<CreateEditEventCubit>().state.timeTo;
          await TimeRangePickerWidget.show(
            context: context,
            initialStartTime: start,
            initialEndTime: end,
            onStartTimeChanged: (value) => start = value,
            onEndTimeChanged: (value) => end = value,
          );
          if (context.mounted) {
            context.read<CreateEditEventCubit>().onTimeChanged(start, end);
          }
        },
      ),
    );
  }
}
