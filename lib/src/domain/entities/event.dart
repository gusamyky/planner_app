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
  final EventStatus status;
  final DateTime date;
  final DateTime timeFrom;
  final DateTime timeTo;

  @override
  List<Object?> get props => [title, description, status, date];
}
