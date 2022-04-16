import 'package:sqflite/sqflite.dart';

import '../Event.dart';
import '../Proces.dart';

abstract class IDatabaseHandler {
  Future<Database> initDatabase();
  void deleteTable();
  void createTables();
  void fillTable();
  void insert();

  Future<List<Proces>> readProcesses(int cpr);
  List<Event> getEvents(int procesID);
  List<String> getEventType(int eventTypeID);
}
