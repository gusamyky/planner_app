import 'package:equatable/equatable.dart';

enum EventStatus { todo, inProgress, done, story }

class Event extends Equatable {
  const Event(
      {required this.title,
      required this.description,
      required this.status,
      required this.date,
      required this.timeFrom,
      required this.timeTo});

  final String title;
  final String description;
  final EventStatus status; //json converter string to status (local base)
  final DateTime date; //same with all dates
  final DateTime timeFrom;
  final DateTime timeTo;

  @override
  List<Object?> get props =>
      [title, description, status, date, timeFrom, timeTo];
}
