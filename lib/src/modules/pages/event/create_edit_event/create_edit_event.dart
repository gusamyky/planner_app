import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/config/styles/palette.dart';
import 'package:planner_app/src/core/helpers/date_time_extensions.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';

@RoutePage()
class CreateEditEventPage extends StatelessWidget {
  const CreateEditEventPage({this.event, super.key});
  final Event? event;

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBarTitle: 'Createeeee',
      body: Center(
        child: Text('create edit event page'),
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
  const _DateIndicator({required this.eventTime});
  final DateTime eventTime;

  @override
  Widget build(BuildContext context) {
    return Text('${eventTime.yMd} - ${eventTime.hm}');
  }
}
