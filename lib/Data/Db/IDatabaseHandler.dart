import 'package:eventlog/Data/EventType.dart';
import 'package:sqflite/sqflite.dart';

import '../Event.dart';
import '../Proces.dart';

abstract class IDatabaseHandler {
  Future<Database> initDatabase();

  void createTables();
  void fillTable();
  void deleteTable();

  Future<List<Proces>> readProcesses(int cpr);
  Future<List<Event>> readEvents(int procesID);
  Future<List<EventType>> readEventType(int eventTypeID);
}
