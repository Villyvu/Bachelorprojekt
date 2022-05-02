import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Data/Proces.dart';
import 'package:eventlog/Domain/ProcessesController.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Given ProcessesController with a list of Processes, When sort is called Then the list is sorted.',
      () async {
    // Arrange
    final ProcessesController processesController =
        ProcessesController(DatabaseHandler.getInstance());
    final List<Proces> list = [];
    final List<String> dates = [
      '2022-05-28 10:05:00',
      '2022-03-28 10:05:00',
      '2022-09-28 10:05:00',
      '2022-03-28 10:15:00'
    ];

    final List<String> sortedDates = [
      '2022-03-28 10:05:00',
      '2022-03-28 10:15:00',
      '2022-05-28 10:05:00',
      '2022-09-28 10:05:00'
    ];

    for (var date in dates) {
      list.add(Proces(1, date, 'Jane Doe', 0123456789));
    }
    // Act
    processesController.sortProcesses(list);
    // Assert
    for (var i = 0; i < list.length; i++) {
      expect(list[i].date, sortedDates[i]);
    }
  });
}
