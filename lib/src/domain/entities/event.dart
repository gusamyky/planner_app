import 'package:isar/isar.dart';

part 'event.g.dart';

enum EventStatus { todo, inProgress, done }

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
