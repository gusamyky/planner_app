import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:planner_app/src/domain/entities/event.dart';

enum DbStatus { init, adding, added, loading, loaded, error }

class IsarService {
  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([EventSchema], directory: dir.path);
  }

  //list od events

  final List<Event> currentEvents = [];

  Future<void> addEvent(Event newEvent) async {
    await isar.writeTxn(() async {
      await isar.events.put(newEvent);
    });
    fetchEvents();
  }

  Future<List<Event>> fetchEvents() async {
    List<Event> fetchedEvents = await isar.events.where().findAll();
    currentEvents.clear();
    currentEvents.addAll(fetchedEvents);
    log(currentEvents.toList().toString());
    return fetchedEvents;
  }

  Future<void> updateEvent(int id, Event newEvent) async {
    var existingEvent = await isar.events.get(id);
    if (existingEvent != null) {
      existingEvent = newEvent;
      await isar.writeTxn(() => isar.events.put(existingEvent!));
      await fetchEvents();
    }
  }

  Future<void> deleteEvent(int id) async {
    await isar.writeTxn(() => isar.events.delete(id));
    await fetchEvents();
  }
}
