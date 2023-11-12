import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:planner_app/src/modules/widgets/event_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';

final eventList = <Event>[
  Event(
      title: 'Title first',
      description: 'Description first',
      status: EventStatus.todo,
      time: DateTime.now()),
  Event(
      title: 'Title second',
      description: 'Description second',
      status: EventStatus.inProgress,
      time: DateTime.now()),
  Event(
      title: 'Title third',
      description: 'Description third',
      status: EventStatus.done,
      time: DateTime.now()),
  Event(
      title: 'Title fourth',
      description: 'Description fourth',
      status: EventStatus.story,
      time: DateTime.now()),
];

@RoutePage()
class DayPage extends StatelessWidget {
  const DayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: AppLocalizations.of(context)!.today,
      body: ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: EventTile(
            event: eventList[index],
          ),
        ),
      ),
    );
  }
}
