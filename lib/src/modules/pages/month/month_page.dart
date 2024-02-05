import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/modules/pages/month/cubit/month_page_cubit.dart';
import 'package:planner_app/src/modules/widgets/event_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';

final now = DateTime.now();

@RoutePage()
class MonthPage extends StatelessWidget {
  const MonthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MonthPageCubit>(
      create: (context) => sl<MonthPageCubit>()..getMonthEvents(),
      child: BlocConsumer<MonthPageCubit, MonthPageState>(
        listenWhen: (previous, current) =>
            previous.dbStatus != current.dbStatus,
        listener: (context, state) {},
        builder: (context, state) {
          return CustomScaffold(
            appBarTitle: AppLocalizations.of(context)!.month,
            body: ListView.builder(
              itemCount: state.allEvents.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: EventTile(
                  event: state.allEvents[index],
                  onDismissed: () => context
                      .read<MonthPageCubit>()
                      .deleteEvent(state.allEvents[index]),
                  monthPageCubit: context.read<MonthPageCubit>(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
