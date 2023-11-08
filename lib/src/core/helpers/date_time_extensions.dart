import 'dart:io';

import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get hm => DateFormat.Hm(Platform.localeName).format(this);

  String get yMd => DateFormat.yMd(Platform.localeName).format(this);

  String get dM => DateFormat.Md(Platform.localeName).format(this);

  String get eeee => DateFormat.EEEE(Platform.localeName).format(this);

  String get e => DateFormat.E(Platform.localeName).format(this);

  String get d => DateFormat.d(Platform.localeName).format(this);

  String get llll => DateFormat.LLLL(Platform.localeName).format(this);

  String get eMd => DateFormat.MEd(Platform.localeName).format(this);

  String get eeeehm => '$eeee $hm';

  DateTime roundUp({Duration delta = const Duration(minutes: 5)}) {
    return add(Duration(minutes: delta.inMinutes - (minute % delta.inMinutes)));
  }
}
