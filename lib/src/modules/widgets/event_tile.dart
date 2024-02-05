import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/config/routes/app_router.dart';
import 'package:planner_app/src/config/styles/app_colors.dart';
import 'package:planner_app/src/config/styles/palette.dart';
import 'package:planner_app/src/core/helpers/date_time_extensions.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';
import 'package:planner_app/src/modules/pages/all_events/cubit/all_events_cubit.dart';
import 'package:planner_app/src/modules/pages/day/cubit/day_page_cubit.dart';
import 'package:planner_app/src/modules/pages/home/cubit/home_page_cubit.dart';
import 'package:planner_app/src/modules/pages/month/cubit/month_page_cubit.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    required this.event,
    required this.onDismissed,
    this.allEventsCubit,
    this.dayPageCubit,
    this.homePageCubit,
    this.monthPageCubit,
    super.key,
  });

  final Event event;
  final void Function() onDismissed;
  final AllEventsCubit? allEventsCubit;
  final MonthPageCubit? monthPageCubit;
  final DayPageCubit? dayPageCubit;
  final HomePageCubit? homePageCubit;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: slideRightBackground(),
      secondaryBackground: slideLeftBackground(),
      key: Key(event.toString()),
      confirmDismiss: (direction) async {
        bool? res;
        if (direction == DismissDirection.endToStart) {
          res = await showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text("Are you sure you want to delete event?"),
                  actions: <Widget>[
                    TextButton(
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        context.router.pop<bool>(false);
                      },
                    ),
                    TextButton(
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        context.router.pop<bool>(true);
                      },
                    ),
                  ],
                );
              });
        } else if (direction == DismissDirection.startToEnd) {
          context.router.navigate(CreateEditEventRoute(
            event: event,
            allEventsCubit: allEventsCubit,
            dayPageCubit: dayPageCubit,
            homePageCubit: homePageCubit,
            monthPageCubit: monthPageCubit,
          ));
        }
        return res;
      },
      onDismissed: (direction) => IsarService().deleteEvent(event),
      child: GestureDetector(
        onTap: () => context.router.push(
          EventRoute(event: event),
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(Constants.space11),
                decoration: BoxDecoration(
                    color: Palette.tileColor,
                    borderRadius: BorderRadius.circular(Constants.tileRadius)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            event.title!,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: AppColors.white,
                                ),
                          ),
                        ),
                        Text(
                          '${event.date?.yMd} - ${event.timeFrom?.hm}',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.white,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Constants.space8),
                    Text(
                      event.description!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.white,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

Widget slideRightBackground() {
  return Container(
    color: Colors.green,
    child: const Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Text(
            " Edit",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ),
  );
}

Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: const Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text(
            " Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
  );
}

Future<bool> confirmDismiss(dynamic direction, BuildContext context) async {
  final bool res = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text("Are you sure you want to delete event?"),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                context.router.pop();
              },
            ),
            TextButton(
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                context.router.pop();
              },
            ),
          ],
        );
      });
  return res;
}
