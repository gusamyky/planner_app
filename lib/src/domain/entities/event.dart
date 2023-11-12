import 'package:equatable/equatable.dart';

enum EventStatus { todo, inProgress, done, story }

class Event extends Equatable {
  const Event({
    required this.title,
    required this.description,
    required this.status,
    required this.time,
  });

  final String title;
  final String description;
  final EventStatus status;
  final DateTime time;

  @override
  List<Object?> get props => [title, description, status, time];
}
