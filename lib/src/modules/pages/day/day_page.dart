import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/modules/pages/day/cubit/day_page_cubit.dart';
import 'package:planner_app/src/modules/widgets/event_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';

final now = DateTime.now();

@RoutePage()
class DayPage extends StatelessWidget {
  const DayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DayPageCubit>(
      create: (context) => sl<DayPageCubit>()..getDayEvents(),
      child: BlocConsumer<DayPageCubit, DayPageState>(
        listenWhen: (previous, current) =>
            previous.dbStatus != current.dbStatus,
        listener: (context, state) {},
        builder: (context, state) {
          return CustomScaffold(
            appBarTitle: AppLocalizations.of(context)!.today,
            body: ListView.builder(
              itemCount: state.dayEvents.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: EventTile(
                  event: state.dayEvents[index],
                  onDismissed: () => context
                      .read<DayPageCubit>()
                      .deleteEvent(state.dayEvents[index]),
                  dayPageCubit: context.read<DayPageCubit>(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
