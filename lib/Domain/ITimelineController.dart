import 'package:eventlog/Data/Event.dart';

abstract class ITimelineController {
  Future<List<Event>> getEvents(int proces_id);
  List<Event> sortEvents(List<Event> list);
}
