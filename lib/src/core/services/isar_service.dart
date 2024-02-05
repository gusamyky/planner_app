import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:planner_app/src/domain/entities/event.dart';

enum DbStatus {
  init,
  adding,
  added,
  loading,
  loaded,
  deleting,
  deleted,
  editing,
  edited,
  error
}

class IsarService {
  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([EventSchema], directory: dir.path);
  }

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
    return fetchedEvents;
  }

  Future<void> updateEvent(int id, Event newEvent) async {
    var existingEvent = await isar.events.get(id);
    existingEvent = newEvent;
    isar.writeTxn(() => isar.events.put(existingEvent!));
    isar.writeTxn(() => isar.events.delete(id));

    await fetchEvents();
  }

  Future<void> deleteEvent(Event event) async {
    log("enter to delete isar");
    await isar.writeTxn(() => isar.events.delete(event.id!));
    await fetchEvents();
    log('deleted isar');
  }
}
