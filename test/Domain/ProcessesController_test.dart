import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Data/Proces.dart';
import 'package:eventlog/Domain/ProcessesController.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'ProcessesController_test.mocks.dart';

@GenerateMocks([DatabaseHandler])
void main() {
  late DatabaseHandler databaseHandler;
  late ProcessesController processesController;
  group('ProcessesController', () {
    setUp(() {
      databaseHandler = MockDatabaseHandler();
      processesController = ProcessesController(databaseHandler);
    });
    test(' getProcesses(int cpr) should return all processes based on cpr',
        () async {
      // Arrange
      //ARRANGE
      List<Proces> list = [];

      final List<Proces> data = [
        Proces(1, '2022-09-28 10:05:00', 'John Doe', 0123456789),
        Proces(2, '2022-09-28 10:05:00', 'Jane Doe', 0123456789)
      ];
      when(databaseHandler.readProcesses(0123456789))
          .thenAnswer((_) async => data);

      //ACT
      list = await processesController.getProcesses(0123456789);

      //ASSERT
      for (var i = 0; i < list.length; i++) {
        expect(list[i].proces_id, data[i].proces_id);
        expect(list[i].date, data[i].date);
        expect(list[i].caretaker, data[i].caretaker);
        expect(list[i].cpr, data[i].cpr);
      }
      verify(databaseHandler.readProcesses(0123456789));
    });

    test(
        'sortProcesses(list) should return a sorted listed descending order based on date',
        () {
      //ARRANGE
      List<Proces> data = [
        Proces(1, '2022-01-21 11:05:00', 'John Doe', 0123456789),
        Proces(2, '2022-06-21 14:05:00', 'Jane Doe', 0123456789),
        Proces(3, '2022-12-03 15:05:00', 'Annie Doe', 0123456789),
        Proces(4, '2022-09-28 11:35:00', 'Yusaf Doe', 0123456789)
      ];

      List<Proces> sortedlist = [
        Proces(3, '2022-12-03 15:05:00', 'Annie Doe', 0123456789),
        Proces(4, '2022-09-28 11:35:00', 'Yusaf Doe', 0123456789),
        Proces(2, '2022-06-21 14:05:00', 'Jane Doe', 0123456789),
        Proces(1, '2022-01-21 11:05:00', 'John Doe', 0123456789)
      ];

      //ACT
      data = processesController.sortProcesses(data);

      //ASSERT
      for (var i = 0; i < data.length; i++) {
        expect(data[i].date, sortedlist[i].date);
      }
    });
  });
}
