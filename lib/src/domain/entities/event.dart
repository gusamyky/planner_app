import 'package:isar/isar.dart';

part 'event.g.dart';

enum EventStatus { todo, inProgress, done, story }

@Collection()
class Event {
  Event(
      {this.title,
      this.description,
      required this.status,
      this.date,
      this.timeFrom,
      this.timeTo});
  Id? id;

  String? title;

  String? description;

  @enumerated
  late EventStatus status;

  DateTime? date;

  DateTime? timeFrom;
  DateTime? timeTo;
}

// @Collection()
// class Event {
//   Event(
//       {required this.id,
//       required this.title,
//       required this.description,
//       required this.status,
//       required this.date,
//       required this.timeFrom,
//       required this.timeTo});

//   Id id = Isar.autoIncrement;
//   final String title;
//   final String description;
//   @enumerated
//   final EventStatus status; //json converter string to status (local base)
//   final DateTime date; //same with all dates
//   final DateTime timeFrom;
//   final DateTime timeTo;
// }
