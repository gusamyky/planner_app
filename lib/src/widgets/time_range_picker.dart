import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/config/styles/palette.dart';

class TimeRangePickerWidget {
  static Future<void> show({
    required BuildContext context,
    required DateTime initialStartTime,
    required DateTime initialEndTime,
    required void Function(DateTime) onStartTimeChanged,
    required void Function(DateTime) onEndTimeChanged,
  }) async {
    await showDialog<Dialog>(
      context: context,
      builder: (context) => _TimeRangePickerDialog(
        initialStartTime,
        initialEndTime,
        onStartTimeChanged,
        onEndTimeChanged,
      ),
    );
  }
}

class _TimeRangePickerDialog extends StatelessWidget {
  const _TimeRangePickerDialog(
    this.initialStartTime,
    this.initialEndTime,
    this.onStartTimeChanged,
    this.onEndTimeChanged,
  );

  final DateTime initialStartTime;
  final DateTime initialEndTime;
  final void Function(DateTime) onStartTimeChanged;
  final void Function(DateTime) onEndTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // backgroundColor: AppColors.blueGray900,
      // surfaceTintColor: AppColors.blueGray900,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 240),
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: <Widget>[
                Flexible(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: true,
                    initialDateTime: initialStartTime,
                    minuteInterval: 5,
                    onDateTimeChanged: onStartTimeChanged,
                  ),
                ),
                Flexible(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: true,
                    initialDateTime: initialEndTime,
                    minuteInterval: 5,
                    onDateTimeChanged: onEndTimeChanged,
                  ),
                ),
                TextButton(
                  onPressed: () => context.router.maybePop(),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Palette.selected),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
