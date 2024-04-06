import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:planner_app/src/modules/cubits/cubit/main_cubit.dart';
import 'package:planner_app/src/modules/pages/week/cubit/week_page_cubit.dart';
import 'package:planner_app/src/modules/widgets/event_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';
import 'package:planner_app/src/widgets/search_bar.dart';

final now = DateTime.now();

@RoutePage()
class WeekPage extends StatelessWidget {
  const WeekPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeekPageCubit>(
          create: (context) => sl<WeekPageCubit>()..getWeekEvents(),
        ),
        BlocProvider<MainCubit>(
          create: (context) => sl<MainCubit>(),
        ),
      ],
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return BlocConsumer<WeekPageCubit, WeekPageState>(
            listenWhen: (previous, current) =>
                previous.dbStatus != current.dbStatus,
            listener: (context, state) {},
            builder: (context, state) {
              final currentList = state.dbStatus == DbStatus.found
                  ? state.foundEvents
                  : state.weekEvents;
              return CustomScaffold(
                appBarTitle: AppLocalizations.of(context)!.week,
                body: Column(
                  children: [
                    if (context.read<MainCubit>().state.isSearchActive) ...[
                      SearchField(
                        onChanged: (value) =>
                            context.read<WeekPageCubit>().search(value),
                      )
                    ],
                    const SizedBox(height: Constants.padding20),
                    _DayPageList(eventList: currentList),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _DayPageList extends StatelessWidget {
  const _DayPageList({required this.eventList});

  final List<Event> eventList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeekPageCubit, WeekPageState>(
      builder: (context, state) {
        if (state.dbStatus == DbStatus.loading ||
            state.dbStatus == DbStatus.searching) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.weekEvents.isNotEmpty) {
          if (state.dbStatus == DbStatus.notFound) {
            return Center(
                child: Text(
              AppLocalizations.of(context)!.not_found,
              style: Theme.of(context).textTheme.bodyLarge,
            ));
          }
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: eventList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: EventTile(
                  event: eventList[index],
                  onDismissed: () => context
                      .read<WeekPageCubit>()
                      .deleteEvent(eventList[index]),
                  dayPageCubit: context.read<WeekPageCubit>(),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.you_have_no_events_week,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }
      },
    );
  }
}
