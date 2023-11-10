import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/core/helpers/date_time_extensions.dart';
import 'package:planner_app/src/modules/widgets/event_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';

@RoutePage()
class MonthPage extends StatelessWidget {
  const MonthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: AppLocalizations.of(context)!.month,
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: EventTile(
            title: 'Title',
            description:
                '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae pulvinar nulla. Fusce porttitor dapibus eros, et fermen ajkdnwkjnfwekfemjkerngjnrejngherhgejbghjebrghjberhjgbjhebgjherbgjhbjhergjhrebhjgbejhg''',
            dateOrTime: DateTime.now().dhm,
          ),
        ),
      ),
    );
  }
}
