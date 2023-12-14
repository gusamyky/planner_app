import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/config/styles/app_colors.dart';
import 'package:planner_app/src/config/styles/palette.dart';
import 'package:planner_app/src/core/helpers/date_time_extensions.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';
import 'package:planner_app/src/widgets/custom_text_field.dart';
import 'package:planner_app/src/widgets/time_range_picker.dart';

@RoutePage()
class CreateEditEventPage extends StatelessWidget {
  const CreateEditEventPage({this.event, super.key});
  final Event? event;

  @override
  Widget build(BuildContext context) {
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
            const CustomTextField(
              maxLines: 1,
              text: 'Title',
              isTitle: true,
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
            const CustomTextField(
                maxLines: 8,
                text:
                    'Nuzno pososat realno sladkiy chlen. Ohh kak zhe ya budu sosat wy prosto ne ponimayete'),
            const SizedBox(height: Constants.padding20),
            _DateIndicator(event: event),
            const SizedBox(height: Constants.padding20),
            const _TimeIndicator(),
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
            child: Text(event == null ? DateTime.now().yMd : event!.date.yMd),
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
        if (result != null && context.mounted) {}
      },
    );
  }
}

class _TimeIndicator extends StatelessWidget {
  const _TimeIndicator({this.event, super.key});
  final Event? event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime now = DateTime.now();
        await TimeRangePickerWidget.show(
          context: context,
          initialStartTime: DateTime(now.year, now.month, now.day, now.hour,
              (now.minute - (now.minute % 5)).toInt()),
          initialEndTime: DateTime(now.year, now.month, now.day, now.hour,
              (now.minute - (now.minute % 5)).toInt() + 30),
          onStartTimeChanged: (p0) {},
          onEndTimeChanged: (p0) {},
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _TimePicker(time: event?.timeFrom),
          const SizedBox(width: Constants.space5),
          const Text('-'),
          const SizedBox(width: Constants.space5),
          _TimePicker(time: event?.timeTo)
        ],
      ),
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
    var dropDownValue = entries.firstWhere(
      (element) => element.value == widget.currentStatus,
    );
    return DropdownMenu(
      initialSelection:
          entries.where((element) => element.value == widget.currentStatus),
      dropdownMenuEntries: entries,
      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: dropDownValue.value == EventStatus.todo
              ? Palette.toDoColor
              : dropDownValue.value == EventStatus.done
                  ? Palette.doneColor
                  : dropDownValue.value == EventStatus.inProgress
                      ? Palette.inProgressColor
                      : Palette.storyColor),
      onSelected: (value) {
        setState(() {
          dropDownValue =
              entries.firstWhere((element) => element.value == value);
        });
        log(dropDownValue.value.toString());
      },
    );
  }
}

class _SaveEditButton extends StatelessWidget {
  const _SaveEditButton({this.isEditing = false, super.key});
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(isEditing
            ? AppLocalizations.of(context)!.edit
            : AppLocalizations.of(context)!.create));
  }
}
