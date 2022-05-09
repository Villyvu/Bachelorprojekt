import 'package:eventlog/Domain/IDatabaseHandler.dart';

import 'package:eventlog/Domain/ITimelineController.dart';

import '../Data/Models/Event.dart';

class TimelineController implements ITimelineController {
  late IDatabaseHandler databaseHandler;

  TimelineController(IDatabaseHandler instance) {
    databaseHandler = instance;
  }

  @override
  Future<List<Event>> getEvents(int proces_id) {
    return databaseHandler.readAllEvents(proces_id);
  }

  @override
  List<Event> sortEvents(List<Event> list) {
    var tempList = list;
    tempList.sort(
      (a, b) {
        return DateTime.parse(a.dateTime).compareTo(DateTime.parse(b.dateTime));
      },
    );
    return tempList;
  }
}
