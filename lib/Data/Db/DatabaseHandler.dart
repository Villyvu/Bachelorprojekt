import 'package:eventlog/Data/Db/IDatabaseHandler.dart';
import 'package:eventlog/Data/EventType.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:eventlog/Data/Proces.dart';

import '../Event.dart';

class DatabaseHandler implements IDatabaseHandler {
  final String title = "Sqllite-Db";

  DatabaseHandler._privateConstructor();
  static final DatabaseHandler _instance =
      DatabaseHandler._privateConstructor();

  // only have a single app-wide reference to the database
  static late Database _database;

  static DatabaseHandler getInstance() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    return _database;
  }

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
    await Future.delayed(Duration(seconds: 3));
    final Database db = await initDatabase();
    //db.delete('proces');
    db.rawDelete('DROP TABLE eventType');
    //db.delete('event');
    print("tables deleted");
  }

  @override
  void createTables() async {
    String procesTable =
        "CREATE TABLE IF NOT EXISTS proces(proces_id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT NOT NULL, caretaker TEXT NOT NULL, cpr INTEGER NOT NULL)";
    String eventTypeTable =
        "CREATE TABLE IF NOT EXISTS eventType(_typeOfEvent_id INTEGER PRIMARY KEY AUTOINCREMENT, _titel TEXT NOT NULL, _description TEXT NOT NULL)";
    String eventTable =
        "CREATE TABLE IF NOT EXISTS event(proces_id INTEGER NOT NULL, _dateTime TEXT NOT NULL, _typeOfEvent_id INTEGER NOT NULL, FOREIGN KEY (proces_ID) REFERENCES proces, FOREIGN KEY (_typeOfEvent_id) REFERENCES eventType)";

    final Database db = await initDatabase();

    db.execute(procesTable);
    db.execute(eventTypeTable);
    db.execute(eventTable);

    print("Tables created");
  }

  @override
  void fillTable() async {
    final Database db = await initDatabase();

    db.rawInsert(
        'INSERT INTO proces(date, caretaker, cpr) VALUES(datetime("now"), "yusaf", 0123456789)');
    db.rawInsert(
        'INSERT INTO proces(date, caretaker, cpr) VALUES(datetime("now"), "kalb", 0123456789)');

    db.rawInsert('INSERT INTO eventType(_titel, _description) VALUES(?,?)',
        ['Modtagelse', 'yusaf er tyk']);

    db.rawInsert(
        'INSERT INTO event(proces_id, _dateTime, _typeOfEvent_id) VALUES(?, ?, ?)',
        [15, '123', 1]);
    db.rawInsert(
        'INSERT INTO event(proces_id, _dateTime, _typeOfEvent_id) VALUES(?, ?, ?)',
        [15, '123', 1]);

    db.rawInsert(
        'INSERT INTO event(proces_id, _dateTime, _typeOfEvent_id) VALUES(?, ?, ?)',
        [1, '123', 1]);

    print("Data added");
  }

  @override
  Future<List<Proces>> readProcesses(int cpr) async {
    await Future.delayed(Duration(seconds: 2));
    print('Reading Processes');
    final Database db = await initDatabase();
    final List<Map<String, Object?>> queryResult = await db
        .query('proces', columns: null, where: 'cpr = ?', whereArgs: [cpr]);
    print(queryResult);
    return queryResult.map((e) => Proces.fromMap(e)).toList();
  }

  @override
  Future<List<Event>> readEvents(int procesID) async {
    await Future.delayed(Duration(seconds: 2));
    print('Reading Events' + " proces_id: " + procesID.toString());
    final Database db = await initDatabase();
    final List<Map<String, Object?>> queryResult = await db.query('event',
        columns: ['proces_id', '_typeOfEvent_id', '_dateTime'],
        where: 'proces_id = ?',
        whereArgs: [procesID]);
    print("Data received: ");
    print(queryResult);
    return queryResult.map((e) => Event.fromMap(e)).toList();
  }

  @override
  Future<List<EventType>> readEventType(int eventTypeID) async {
    print('Reading EventType: ' + eventTypeID.toString());
    final Database db = await initDatabase();
    final List<Map<String, Object?>> queryResult = await db.query('eventType',
        columns: ['_titel', '_description'],
        where: '_typeOfEvent_id = ?',
        whereArgs: [eventTypeID]);
    print(queryResult);
    return queryResult.map((e) => EventType.fromMap(e)).toList();
  }
}
