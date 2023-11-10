import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planner_app/src/config/styles/palette.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    required this.icon,
    this.color = Palette.unselected,
    super.key,
  });

  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    switch (icon.split('.').last) {
      case 'svg':
        return SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      default:
        return Image.asset(icon, width: 24, height: 24);
    }
  }
}

class AppIcons {
  static const home = 'assets/icons/home.svg';
  static const calendarDay = 'assets/icons/calendar-day.svg';
  static const calendar = 'assets/icons/calendar.svg';
  static const list = 'assets/icons/list.svg';
  static const plus = 'assets/icons/plus.svg';
  static const search = 'assets/icons/search.svg';
}
