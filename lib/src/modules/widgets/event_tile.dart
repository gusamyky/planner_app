import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/config/routes/app_router.dart';
import 'package:planner_app/src/config/styles/app_colors.dart';
import 'package:planner_app/src/config/styles/palette.dart';
import 'package:planner_app/src/core/helpers/date_time_extensions.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:planner_app/src/modules/pages/all_events/cubit/all_events_cubit.dart';
import 'package:planner_app/src/modules/pages/week/cubit/week_page_cubit.dart';
import 'package:planner_app/src/modules/pages/home/cubit/home_page_cubit.dart';
import 'package:planner_app/src/modules/pages/month/cubit/month_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventTile extends StatefulWidget {
  const EventTile({
    required this.event,
    required this.deleteFunc,
    this.onTap,
    this.allEventsCubit,
    this.weekPageCubit,
    this.homePageCubit,
    this.monthPageCubit,
    super.key,
  });

  final Event event;
  final void Function() deleteFunc;
  final void Function()? onTap;

  final AllEventsCubit? allEventsCubit;
  final MonthPageCubit? monthPageCubit;
  final WeekPageCubit? weekPageCubit;
  final HomePageCubit? homePageCubit;

  @override
  State<EventTile> createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  bool isActive = false;

  Color statusColor(EventStatus status) {
    if (status == EventStatus.todo) {
      return Palette.toDoColor;
    } else if (status == EventStatus.inProgress) {
      return Palette.inProgressColor;
    } else {
      return Palette.doneColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(
        EventRoute(event: widget.event),
      ),
      onLongPress: () => setState(() => isActive = !isActive),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(Constants.space11),
              decoration: BoxDecoration(
                  color: Palette.tileColor,
                  border: BorderDirectional(
                      start: BorderSide(
                          color: statusColor(widget.event.status), width: 2)),
                  borderRadius: BorderRadius.circular(Constants.tileRadius)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.event.title!,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: AppColors.white,
                                  ),
                        ),
                      ),
                      Text(
                        '${widget.event.date?.eMd}',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.space8),
                  Row(
                    mainAxisAlignment: !isActive
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.event.description!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      if (isActive) ...[
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.router.navigate(CreateEditEventRoute(
                                    event: widget.event,
                                    allEventsCubit: widget.allEventsCubit,
                                    homePageCubit: widget.homePageCubit,
                                    weekPageCubit: widget.weekPageCubit,
                                    monthPageCubit: widget.monthPageCubit,
                                  ));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Palette.selected,
                                )),
                            IconButton(
                                onPressed: () async {
                                  await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Palette.tileColor,
                                          surfaceTintColor: Palette.tileColor,
                                          content: Text(
                                              AppLocalizations.of(context)!
                                                  .delete_confirm),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .cancel,
                                                style: const TextStyle(
                                                    color: Palette.selected),
                                              ),
                                              onPressed: () {
                                                context.router.maybePop();
                                              },
                                            ),
                                            TextButton(
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .delete,
                                                style: const TextStyle(
                                                    color: Colors.red),
                                              ),
                                              onPressed: () async {
                                                widget.deleteFunc();
                                                context.router.maybePop();
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        )
                      ],
                      if (!isActive) ...[
                        const Spacer(),
                        Text('${widget.event.timeFrom?.hm}'),
                      ]
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
