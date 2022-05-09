import 'package:eventlog/Data/datasources/ISql_Database.dart';
import 'package:eventlog/Domain/IDatabaseHandler.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../Models/Event.dart';
import '../Models/Proces.dart';

class DatabaseHandler implements IDatabaseHandler {
  ISqlDatabase database;

  DatabaseHandler({required this.database});

  @override
  Future<List<Event>> readAllEvents(int proces_id) async {
    final List<Map<String, Object?>> queryResult =
        await database.readAllEvents(proces_id);
    print(queryResult);
    return queryResult.map((e) => Event.fromMap(e)).toList();
  }

  @override
  Future<List<Proces>> readProcesses(int cpr) async {
    final List<Map<String, Object?>> queryResult =
        await database.readProcesses(cpr);
    print(queryResult);
    return queryResult.map((e) => Proces.fromMap(e)).toList();
  }
}
