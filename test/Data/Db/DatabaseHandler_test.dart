import 'package:eventlog/Data/Models/Event.dart';
import 'package:eventlog/Data/Models/Proces.dart';
import 'package:eventlog/Data/datasources/ISql_Database.dart';
import 'package:eventlog/Data/datasources/sql_Db.dart';
import 'package:eventlog/Data/repos/DatabaseHandler.dart';
import 'package:eventlog/Domain/IDatabaseHandler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

import 'DatabaseHandler_test.mocks.dart';

@GenerateMocks([SqlDb])
void main() {
  late IDatabaseHandler databaseHandler;
  late ISqlDatabase db;
  group('DatabaseHandler', () {
    setUp(() {
      db = MockSqlDb();
      databaseHandler = DatabaseHandler(database: db);
    });
    test('read Processes', () async {
      //ARRANGE
      final List<Proces> expectedList = [
        Proces(1, '2022-09-28 10:05:00', 'John Doe', 0123456789),
        Proces(2, '2022-02-04 16:05:00', 'Jane Doe', 0123456789)
      ];

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
      when(db.readProcesses(123456789)).thenAnswer((_) async => data);

      //ACT
      List<Proces> receivedData =
          await databaseHandler.readProcesses(123456789);

      //ASSERT
      for (var i = 0; i < receivedData.length; i++) {
        expect(receivedData[i].proces_id, expectedList[i].proces_id);
        expect(receivedData[i].date, expectedList[i].date);
        expect(receivedData[i].caretaker, expectedList[i].caretaker);
        expect(receivedData[i].cpr, expectedList[i].cpr);
      }
    });
    test('read allEvents', () async {
      //ARRANGE
      final List<Event> expectedList = [
        Event(
            1,
            '2022-04-28 10:05:00',
            'Modtagelse af sygeplejerske',
            'Du er ankommet til Fælles Akutmodtagelse og blevet indregistreret i systemet. En sygeplejerske har taget imod dig på en stue, samt spurgt nærmere ind til din skade/sygdom og grunden til du er her. Sygeplejersken bruger nu den information du har afgivet, til at bestemme en passende behandlingsplan',
            58262),
        Event(
            1,
            '2022-04-28 12:05:00',
            'COVID-19 screening',
            'Da COVID-19 stadig fylder en del i det danske samfund, er det derfor nødvendigt at teste alle patienter der kommer ind på FAM. Det er et vigtigt led i behandlingen, da eventuel smitte af andre akutte patienter, kan have store konsekvenser.',
            62641)
      ];

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

      when(db.readAllEvents(1)).thenAnswer((_) async => data);

      //ACT
      List<Event> receivedData = await databaseHandler.readAllEvents(1);

      //ASSERT
      for (var i = 0; i < receivedData.length; i++) {
        expect(receivedData[i].proces_id, expectedList[i].proces_id);
        expect(receivedData[i].dateTime, expectedList[i].dateTime);
        expect(receivedData[i].titel, expectedList[i].titel);
        expect(receivedData[i].icon, expectedList[i].icon);
      }
    });
  });
}
