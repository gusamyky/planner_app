import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/config/styles/app_colors.dart';
import 'package:planner_app/src/config/styles/palette.dart';
import 'package:planner_app/src/core/helpers/date_time_extensions.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/modules/pages/all_events/cubit/all_events_cubit.dart';
import 'package:planner_app/src/modules/pages/week/cubit/week_page_cubit.dart';
import 'package:planner_app/src/modules/pages/event/create_edit_event/cubit/create_edit_event_cubit.dart';
import 'package:planner_app/src/modules/pages/home/cubit/home_page_cubit.dart';
import 'package:planner_app/src/modules/pages/month/cubit/month_page_cubit.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';
import 'package:planner_app/src/widgets/custom_text_field.dart';
import 'package:planner_app/src/widgets/time_range_picker.dart';

@RoutePage()
class CreateEditEventPage extends StatelessWidget {
  const CreateEditEventPage({
    this.allEventsCubit,
    this.event,
    this.homePageCubit,
    this.weekPageCubit,
    this.monthPageCubit,
    super.key,
  });
  final Event? event;
  final AllEventsCubit? allEventsCubit;
  final HomePageCubit? homePageCubit;
  final WeekPageCubit? weekPageCubit;
  final MonthPageCubit? monthPageCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateEditEventCubit>(
      create: (context) => sl<CreateEditEventCubit>()..onInitial(event),
      child: BlocConsumer<CreateEditEventCubit, CreateEditEventState>(
        listener: (BuildContext context, CreateEditEventState state) async {
          if (state.stateStatus == StateStatus.edited) {
            if (allEventsCubit != null) {
              allEventsCubit!.getAllEvents().then(
                    (value) => context.router.maybePop(),
                  );
            } else if (homePageCubit != null) {
              homePageCubit!.getHomeEvents().then(
                    (value) => context.router.maybePop(),
                  );
            } else if (weekPageCubit != null) {
              weekPageCubit!.getWeekEvents().then(
                    (value) => context.router.maybePop(),
                  );
            } else if (monthPageCubit != null) {
              monthPageCubit!.getMonthEvents().then(
                    (value) => context.router.maybePop(),
                  );
            }
          } else if (state.stateStatus == StateStatus.added) {
            allEventsCubit!.getAllEvents();
            homePageCubit!.getHomeEvents();
            weekPageCubit!.getWeekEvents();
            monthPageCubit!.getMonthEvents();
            context.router.maybePop();
          } else if (state.stateStatus == StateStatus.error) {
            Fluttertoast.showToast(
                msg: AppLocalizations.of(context)!.cross_events_error);
          }
        },
        listenWhen: (previous, current) =>
            current.stateStatus != previous.stateStatus,
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
                  _SaveEditButton(
                    event: event,
                  ),
                ],
              ),
            ),
          );
        },
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
                : event!.date!.yMd),
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
          initialDate: event != null ? event!.date! : DateTime.now(),
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

class _StatusPicker extends StatefulWidget {
  const _StatusPicker({this.currentStatus = EventStatus.todo});
  final EventStatus? currentStatus;

  @override
  State<_StatusPicker> createState() => _StatusPickerState();
}

class _StatusPickerState extends State<_StatusPicker> {
  @override
  Widget build(BuildContext context) {
    widget.currentStatus ?? EventStatus.todo;
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
    ];
    return DropdownMenu(
      initialSelection: widget.currentStatus,
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
  const _SaveEditButton({this.event});
  final Event? event;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          event != null
              ? context.read<CreateEditEventCubit>().onEditEvent(event!)
              : context.read<CreateEditEventCubit>().onCreateEvent();
        },
        child: Text(event != null
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
