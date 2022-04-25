import 'package:eventlog/Data/EventType.dart';

abstract class IEventDescrptionController {
  Future<List<EventType>> getTypeOfEvent(int typeofEvent_id);
}
