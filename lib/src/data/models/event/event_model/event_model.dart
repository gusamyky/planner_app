import 'package:json_annotation/json_annotation.dart';
import 'package:planner_app/src/domain/entities/event.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel extends Event {
  const EventModel(
      {required super.title,
      required super.description,
      required super.status,
      required super.time});

  factory EventModel.fromJson(Map<String, dynamic> jsonMap) =>
      _$EventModelFromJson(jsonMap);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
  //to local
  //from local
}
