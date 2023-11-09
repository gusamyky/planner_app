import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/core/helpers/date_time_extensions.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/modules/widgets/event_tile.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(Constants.appPadding),
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: EventTile(
            title: 'Title',
            description:
                '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae pulvinar nulla. Fusce porttitor dapibus eros, et fermen ajkdnwkjnfwekfemjkerngjnrejngherhgejbghjebrghjberhjgbjhebgjherbgjhbjhergjhrebhjgbejhg''',
            dateOrTime: DateTime.now().hm,
          ),
        ),
      ),
    );
  }
}
