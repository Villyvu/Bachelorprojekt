import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main(List<String> args) async {
  sqfliteFfiInit();
  test('readTest', () async {
    var db = DatabaseHandler();
    db.fillTable();
  });
}
