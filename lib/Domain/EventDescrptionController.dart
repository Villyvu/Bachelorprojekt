import 'package:eventlog/Data/Db/IDatabaseHandler.dart';
import 'package:eventlog/Data/EventType.dart';
import 'package:eventlog/Domain/IEventDescrptionController.dart';

class EventDescrptionController implements IEventDescrptionController {
  late IDatabaseHandler databaseHandler;

  EventDescrptionController(IDatabaseHandler instance) {
    databaseHandler = instance;
  }

  @override
  Future<List<EventType>> getTypeOfEvent(int typeofEvent_id) {
    return databaseHandler.readEventType(typeofEvent_id);
  }
}
