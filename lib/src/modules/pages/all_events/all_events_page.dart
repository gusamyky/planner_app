import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:planner_app/src/modules/cubits/cubit/main_cubit.dart';
import 'package:planner_app/src/modules/pages/all_events/cubit/all_events_cubit.dart';
import 'package:planner_app/src/modules/widgets/event_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';
import 'package:planner_app/src/widgets/search_bar.dart';

final now = DateTime.now();

@RoutePage()
class AllEventsPage extends StatelessWidget {
  const AllEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllEventsCubit>(
          create: (context) => sl<AllEventsCubit>()..getAllEvents(),
        ),
        BlocProvider<MainCubit>(
          create: (context) => sl<MainCubit>()..getAllEvents(),
        ),
      ],
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return BlocConsumer<AllEventsCubit, AllEventsState>(
            listenWhen: (previous, current) =>
                previous.dbStatus != current.dbStatus,
            listener: (context, state) {},
            builder: (context, state) {
              final currentList = state.dbStatus == DbStatus.found
                  ? state.foundEvents
                  : state.allEvents;

              return CustomScaffold(
                appBarTitle: AppLocalizations.of(context)!.all_events,
                body: Column(
                  children: [
                    if (context.read<MainCubit>().state.isSearchActive) ...[
                      SearchField(
                        onChanged: (value) =>
                            context.read<AllEventsCubit>().search(value),
                      )
                    ],
                    const SizedBox(height: Constants.padding20),
                    _AllEventsList(eventList: currentList),
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

class _AllEventsList extends StatelessWidget {
  const _AllEventsList({required this.eventList});

  final List<Event> eventList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllEventsCubit, AllEventsState>(
      builder: (context, state) {
        if (state.dbStatus == DbStatus.loading ||
            state.dbStatus == DbStatus.searching) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.allEvents.isNotEmpty) {
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
                child: Column(
                  children: [
                    if (index == 0 ||
                        eventList[index].date!.month !=
                            eventList[index - 1].date!.month) ...[
                      // Text(DateFormat.MMMM().format(eventList[index].date!)),
                      Text(getMonthStringLocale(
                          eventList[index].date!.month, context)),
                      const SizedBox(height: Constants.padding15),
                    ],
                    EventTile(
                      event: eventList[index],
                      onDismissed: () => context
                          .read<AllEventsCubit>()
                          .deleteEvent(eventList[index]),
                      allEventsCubit: context.read<AllEventsCubit>(),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.you_have_no_events,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }
      },
    );
  }
}

String getMonthStringLocale(int monthNum, BuildContext context) {
  final monthMap = <int, String>{
    1: AppLocalizations.of(context)!.month1,
    2: AppLocalizations.of(context)!.month2,
    3: AppLocalizations.of(context)!.month3,
    4: AppLocalizations.of(context)!.month4,
    5: AppLocalizations.of(context)!.month5,
    6: AppLocalizations.of(context)!.month6,
    7: AppLocalizations.of(context)!.month7,
    8: AppLocalizations.of(context)!.month8,
    9: AppLocalizations.of(context)!.month9,
    10: AppLocalizations.of(context)!.month10,
    11: AppLocalizations.of(context)!.month11,
    12: AppLocalizations.of(context)!.month12,
  };

  return monthMap[monthNum]!;
}
