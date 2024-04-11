import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:planner_app/src/domain/entities/event.dart';

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

  Future<int> getEventId(Event event) async {
    final fetchedEvents = await isar.events.where().findAll();
    final res = fetchedEvents
        .firstWhere((element) => element.timeFrom == event.timeFrom);
    return res.id!;
  }

  Future<void> updateEvent(int id, Event newEvent) async {
    var existingEvent = await isar.events.get(id);
    existingEvent = newEvent;
    await isar.writeTxn(() async => await isar.events.put(existingEvent!));
    await isar.writeTxn(() async => await isar.events.delete(id));

    await fetchEvents();
  }

  Future<void> deleteEvent(Event event) async {
    await isar.writeTxn(() async => await isar.events.delete(event.id!));
    await fetchEvents();
  }
}
