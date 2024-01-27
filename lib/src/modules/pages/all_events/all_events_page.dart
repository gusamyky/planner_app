import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/modules/pages/all_events/cubit/all_events_cubit.dart';
import 'package:planner_app/src/modules/widgets/event_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';

final now = DateTime.now();

@RoutePage()
class AllEventsPage extends StatelessWidget {
  const AllEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AllEventsCubit>(
      create: (context) => sl<AllEventsCubit>()..getAllEvents(),
      child: BlocConsumer<AllEventsCubit, AllEventsState>(
        listenWhen: (previous, current) =>
            previous.dbStatus != current.dbStatus,
        listener: (context, state) {},
        builder: (context, state) {
          if (state.dbStatus == DbStatus.loaded) {
            return CustomScaffold(
              appBarTitle: AppLocalizations.of(context)!.all_events,
              body: ListView.builder(
                itemCount: state.allEvents.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      if (index == 0 ||
                          state.allEvents[index].date!.month !=
                              state.allEvents[index - 1].date!.month) ...[
                        Text(state.allEvents[index].date!.month.toString()),
                        const SizedBox(height: Constants.padding15),
                      ],
                      EventTile(
                        event: state.allEvents[index],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state.dbStatus == DbStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
              child: Text('HUUUY'),
            );
          }
        },
      ),
    );
  }
}
