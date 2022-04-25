import 'package:eventlog/Data/Db/DatabaseHandler.dart';
import 'package:eventlog/Data/Db/IDatabaseHandler.dart';
import 'package:eventlog/Data/Event.dart';
import 'package:eventlog/Domain/ITimelineController.dart';

class TimelineController implements ITimelineController {
  late IDatabaseHandler databaseHandler;

  TimelineController(IDatabaseHandler instance) {
    databaseHandler = instance;
  }

  @override
  Future<List<Event>> getEvents(int proces_id) {
    return databaseHandler.readEvents(proces_id);
  }

  @override
  List<Event> sortEvents(List<Event> list) {
    var tempList = list;
    tempList.sort(
      (a, b) {
        return a.dateTime.compareTo(b.dateTime);
      },
    );
    return tempList;
  }
}
