import 'package:flutter/material.dart';
import 'package:planner_app/src/config/styles/app_colors.dart';
import 'package:planner_app/src/config/styles/palette.dart';
import 'package:planner_app/src/core/utils/constants.dart';

class EventTile extends StatelessWidget {
  const EventTile(
      {required this.title,
      required this.description,
      required this.dateOrTime,
      super.key});
  final String title;
  final String description;
  final String dateOrTime;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                    Text(
                      dateOrTime,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: Constants.space8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.white,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            )),
      ],
    );
  }
}
