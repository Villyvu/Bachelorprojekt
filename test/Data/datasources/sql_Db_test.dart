import 'package:eventlog/Data/Models/Event.dart';
import 'package:eventlog/Data/datasources/sql_Db.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

import 'sql_Db_test.mocks.dart';

@GenerateMocks([Database])
void main() {
  late Database db;
  late SqlDb sqlDb;
  group('Testing class SqlDB', () {
    setUp(() {
      db = MockDatabase();
      sqlDb = SqlDb(db);
    });
    test('Testing reading processes', () async {
      //ARRANGE
      final List<Map<String, Object?>> data = [
        {
          'proces_id': 1,
          'date': '2022-09-28 10:05:00',
          'caretaker': 'John Doe',
          'cpr': 123456789
        },
        {
          'proces_id': 2,
          'date': '2022-02-04 16:05:00',
          'caretaker': 'Jane Doe',
          'cpr': 123456789
        }
      ];
      int cpr = 0123456789;
      when(db.query(any, whereArgs: [0123456789]))
          .thenAnswer((_) async => data);

      //ACT
      var receivedData = await sqlDb.readProcesses(0123456789);

      //ASSERT
      expect(receivedData, data);
    });

    test('Testing readAllEvents', () async {
      //ARRANGE
      final List<Map<String, Object?>> data = [
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
      ];

      when(db.rawQuery(
          'SELECT proces_id, _datetime, _titel, _description, _icon  FROM event INNER JOIN eventtype on eventtype._typeOfEvent_id = event._typeOfEvent_id WHERE proces_id = ?',
          [argThat(contains(1))])).thenAnswer((_) async => data);
      //ACT
      var receivedData = await sqlDb.readAllEvents(1);
      //ASSERT
      expect(receivedData, [
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
    });
  });
}
