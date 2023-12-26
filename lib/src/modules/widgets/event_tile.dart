import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/config/routes/app_router.dart';
import 'package:planner_app/src/config/styles/app_colors.dart';
import 'package:planner_app/src/config/styles/palette.dart';
import 'package:planner_app/src/core/helpers/date_time_extensions.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/domain/entities/event.dart';

class EventTile extends StatelessWidget {
  const EventTile({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                      Text(
                        event.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                      Text(
                        '${event.date.yMd} - ${event.timeFrom.hm}',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.space8),
                  Text(
                    event.description,
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
    );
  }
}
