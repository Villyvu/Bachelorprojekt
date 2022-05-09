import 'package:eventlog/Data/datasources/ISql_Database.dart';
import 'package:eventlog/Data/datasources/sql_Db.dart';
import 'package:eventlog/Data/repos/DatabaseHandler.dart';
import 'package:eventlog/Domain/IDatabaseHandler.dart';
import 'package:eventlog/Domain/IProcessesController.dart';
import 'package:eventlog/Domain/ITimelineController.dart';
import 'package:eventlog/Domain/ProcessesController.dart';
import 'package:eventlog/Domain/TimelineController.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final sl = GetIt.I;
final String title = "Sqllite-Db";

Future<void> init() async {
  sl.registerLazySingleton<IProcessesController>(
      () => ProcessesController(sl()));

  sl.registerLazySingleton<ITimelineController>(() => TimelineController(sl()));

  sl.registerLazySingleton<IDatabaseHandler>(
      () => DatabaseHandler(database: sl()));

  sl.registerLazySingleton<ISqlDatabase>(() => SqlDb(sl()));

  final Database db = await _initDatabase();
  sl.registerLazySingleton<Database>(() => db);
}

Future<Database> _initDatabase() async {
  String path = await getDatabasesPath();
  return await openDatabase(
    join(path, title),
    version: 1,
  );
}
