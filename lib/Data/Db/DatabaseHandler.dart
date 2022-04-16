import 'dart:math';

import 'package:eventlog/Data/Db/IDatabaseHandler.dart';
import 'package:eventlog/Presentation/Components/data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:eventlog/Data/Proces.dart';

import '../Event.dart';

class DatabaseHandler implements IDatabaseHandler {
  final String title = "Sqllite-Db";

  @override
  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    return await openDatabase(
      join(path, title),
      version: 1,
    );
  }

  @override
  void deleteTable() async {
    final Database db = await initDatabase();
    db.delete('proces');
  }

  @override
  void createTables() async {
    String procesTable =
        "CREATE TABLE IF NOT EXISTS proces(proces_id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT NOT NULL, caretaker TEXT NOT NULL, cpr INTEGER NOT NULL)";
    String eventTypeTable =
        "CREATE TABLE IF NOT EXISTS eventType(eventType_id INTEGER PRIMARY KEY AUTOINCREMENT, titel TEXT NOT NULL, description TEXT NOT NULL)";
    String eventTable =
        "CREATE TABLE IF NOT EXISTS event(proces_ID INTEGER NOT NULL, date TEXT NOT NULL, eventType_id INTEGER NOT NULL, FOREIGN KEY (proces_ID) REFERENCE proces, FOREIGN KEY (eventType_id) reference eventType)";

    final Database db = await initDatabase();
    Batch batch = db.batch();
    batch.execute(procesTable);
    batch.execute(eventTypeTable);
    batch.execute(eventTable);
    batch.commit(noResult: true);

    print("createdTables");
  }

  @override
  void fillTable() async {
    final Database db = await initDatabase();
    db.rawInsert(
        'INSERT INTO proces(date, caretaker, cpr) VALUES(datetime("now"), "yusaf", 0123456789)');
    db.rawInsert(
        'INSERT INTO proces(date, caretaker, cpr) VALUES(datetime("now"), "kalb", 0123456789)');
  }

  @override
  List<String> getEventType(int eventTypeID) {
    // TODO: implement getEventType
    throw UnimplementedError();
  }

  @override
  Future<List<Proces>> readProcesses(int cpr) async {
    print('Reading Processes');
    final Database db = await initDatabase();
    final List<Map<String, Object?>> queryResult = await db
        .query('proces', columns: null, where: 'cpr = ?', whereArgs: [cpr]);
    print(queryResult);
    return queryResult.map((e) => Proces.fromMap(e)).toList();
  }

  @override
  List<Event> getEvents(int procesID) {
    // TODO: implement getEventList
    throw UnimplementedError();
  }

  @override
  void insert() async {
    final Database db = await initDatabase();
    db.rawInsert(
        'INSERT INTO proces(date, caretaker, cpr) VALUES(datetime("now"), "tarik", 0123456789)');
  }
}
