import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Data/Event.dart';
import 'package:eventlog/Domain/TimelineController.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'TimelineController_test.mocks.dart';

@GenerateMocks([DatabaseHandler])
void main() {
  late DatabaseHandler databaseHandler;
  late TimelineController timelineController;

  group('Timelinecontroller...', () {
    setUp(() {
      databaseHandler = MockDatabaseHandler();
      timelineController = TimelineController(databaseHandler);
    });
    test(
        ' readAllEvents(proces_id) returns a list of Events with a specific proces_id',
        () async {
      //ARRANGE
      List<Event> list = [];

      final List<Event> data = [
        Event(1, '2022-09-27 13:05:00', 'Modtagelse', 'Beskrivelse', 4321),
        Event(1, '2022-09-28 10:05:00', 'Udskrivelse', 'Beskrivelse', 1234)
      ];
      when(databaseHandler.readAllEvents(1)).thenAnswer((_) async => data);

      //ACT
      list = await timelineController.getEvents(1);

      //ASSERT
      for (var i = 0; i < list.length; i++) {
        expect(list[i].proces_id, data[i].proces_id);
        expect(list[i].dateTime, data[i].dateTime);
        expect(list[i].titel, data[i].titel);
        expect(list[i].description, data[i].description);
        expect(list[i].icon, data[i].icon);
      }
      verify(databaseHandler.readAllEvents(1));
    });

    test('sortEvents(list) returns a sorted list with date in ascending order',
        () async {
      //ARRANGE

      List<Event> data = [
        Event(1, '2022-09-28 12:05:00', 'Udskrivelse', 'Beskrivelse', 2341),
        Event(1, '2022-09-27 13:05:00', 'Modtagelse', 'Beskrivelse', 4321),
        Event(1, '2022-09-28 10:05:00', 'Corona-Screening', 'Beskrivelse', 1234)
      ];

      List<Event> sortedlist = [
        Event(1, '2022-09-27 13:05:00', 'Modtagelse', 'Beskrivelse', 4321),
        Event(
            1, '2022-09-28 10:05:00', 'Corona-Screening', 'Beskrivelse', 1234),
        Event(1, '2022-09-28 12:05:00', 'Udskrivelse', 'Beskrivelse', 2341)
      ];

      //ACT
      data = timelineController.sortEvents(data);

      //ASSERT
      for (var i = 0; i < data.length; i++) {
        expect(data[i].dateTime, sortedlist[i].dateTime);
      }
    });
  });
}
