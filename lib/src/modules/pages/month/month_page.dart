import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:planner_app/src/modules/widgets/event_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';

final now = DateTime.now();

@RoutePage()
class MonthPage extends StatelessWidget {
  const MonthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: AppLocalizations.of(context)!.month,
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: EventTile(
            event: Event(
                title: 'title',
                description: 'description',
                status: EventStatus.done,
                date: DateTime.now(),
                timeFrom: DateTime.now(),
                timeTo: DateTime.now()),
          ),
        ),
      ),
    );
  }
}
