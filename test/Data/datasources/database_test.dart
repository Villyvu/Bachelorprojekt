import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Initialize sqflite for test.
void sqfliteTestInit() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;
}

Future main() async {
  sqfliteTestInit();
  String procesTable =
      "CREATE TABLE IF NOT EXISTS proces(proces_id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT NOT NULL, caretaker TEXT NOT NULL, cpr INTEGER NOT NULL)";
  String eventTypeTable =
      "CREATE TABLE IF NOT EXISTS eventType(_typeOfEvent_id INTEGER PRIMARY KEY AUTOINCREMENT, _titel TEXT NOT NULL, _description TEXT NOT NULL, _icon INTERGER NOT NULL)";
  String eventTable =
      "CREATE TABLE IF NOT EXISTS event(proces_id INTEGER NOT NULL, _dateTime TEXT NOT NULL, _typeOfEvent_id INTEGER NOT NULL, FOREIGN KEY (proces_ID) REFERENCES proces, FOREIGN KEY (_typeOfEvent_id) REFERENCES eventType)";

  group('', () {
    setUpAll(() async {
      var db = await openDatabase(inMemoryDatabasePath);
      await db.execute(procesTable);
      await db.execute(eventTypeTable);
      await db.execute(eventTable);
    });
    test('query from proces table', () async {
      //ARRANGE
      var db = await openDatabase(inMemoryDatabasePath);
      db.rawInsert(
          'INSERT INTO proces(date, caretaker, cpr) VALUES("2022-06-28 16:05:00", "John Doe", 0123456789)');

      //ACT
      var queryResult = await db.query('proces',
          columns: null, where: 'cpr = ?', whereArgs: [0123456789]);

      expect(queryResult, [
        {
          'proces_id': 1,
          'date': '2022-06-28 16:05:00',
          'caretaker': 'John Doe',
          'cpr': 123456789
        }
      ]);
    });

    test('query from event and eventtype table', () async {
      //ARRANGE
      var db = await openDatabase(inMemoryDatabasePath);

      //Inserting a proces
      db.rawInsert(
          'INSERT INTO proces(date, caretaker, cpr) VALUES("2022-06-28 16:05:00", "John Doe", 0123456789)');

      //Inserting eventType's
      db.rawInsert(
          'INSERT INTO eventType(_titel, _description, _icon) VALUES(?,?,?)', [
        'Modtagelse af sygeplejerske',
        'Du er ankommet til Fælles Akutmodtagelse og blevet indregistreret i systemet. En sygeplejerske har taget imod dig på en stue, samt spurgt nærmere ind til din skade/sygdom og grunden til du er her. Sygeplejersken bruger nu den information du har afgivet, til at bestemme en passende behandlingsplan',
        58262
      ]);

      db.rawInsert(
          'INSERT INTO eventType(_titel, _description, _icon) VALUES(?,?,?)', [
        'COVID-19 screening',
        'Da COVID-19 stadig fylder en del i det danske samfund, er det derfor nødvendigt at teste alle patienter der kommer ind på FAM. Det er et vigtigt led i behandlingen, da eventuel smitte af andre akutte patienter, kan have store konsekvenser.',
        62641
      ]);
      //Inserting an event
      db.rawInsert(
          'INSERT INTO event(proces_id, _dateTime, _typeOfEvent_id) VALUES(?, ?, ?)',
          [1, '2022-04-28 10:05:00', 1]);

      db.rawInsert(
          'INSERT INTO event(proces_id, _dateTime, _typeOfEvent_id) VALUES(?, ?, ?)',
          [1, '2022-04-28 12:05:00', 2]);

      //ACT
      var queryResult = await db.rawQuery(
          'SELECT proces_id, _datetime, _titel, _description, _icon  FROM event INNER JOIN eventtype on eventtype._typeOfEvent_id = event._typeOfEvent_id WHERE proces_id = ?',
          [1]);

      //ASSERT
      expect(queryResult, [
        {
          'proces_id': 1,
          '_dateTime': '2022-04-28 10:05:00',
          '_titel': 'Modtagelse af sygeplejerske',
          '_description':
              'Du er ankommet til Fælles Akutmodtagelse og blevet indregistreret i systemet. En sygeplejerske har taget imod dig på en stue, samt spurgt nærmere ind til din skade/sygdom og grunden til du er her. Sygeplejersken bruger nu den information du har afgivet, til at bestemme en passende behandlingsplan',
          '_icon': 58262
        },
        {
          'proces_id': 1,
          '_dateTime': '2022-04-28 12:05:00',
          '_titel': 'COVID-19 screening',
          '_description':
              'Da COVID-19 stadig fylder en del i det danske samfund, er det derfor nødvendigt at teste alle patienter der kommer ind på FAM. Det er et vigtigt led i behandlingen, da eventuel smitte af andre akutte patienter, kan have store konsekvenser.',
          '_icon': 62641
        }
      ]);

      await db.close();
    });
  });
}
