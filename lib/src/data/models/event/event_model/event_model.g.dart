// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      title: json['title'] as String,
      description: json['description'] as String,
      status: $enumDecode(_$EventStatusEnumMap, json['status']),
      date: DateTime.parse(json['date'] as String),
      timeFrom: DateTime.parse(json['timeFrom'] as String),
      timeTo: DateTime.parse(json['timeTo'] as String),
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'status': _$EventStatusEnumMap[instance.status]!,
      'date': instance.date.toIso8601String(),
      'timeFrom': instance.timeFrom.toIso8601String(),
      'timeTo': instance.timeTo.toIso8601String(),
    };

const _$EventStatusEnumMap = {
  EventStatus.todo: 'todo',
  EventStatus.inProgress: 'inProgress',
  EventStatus.done: 'done',
  EventStatus.story: 'story',
};
