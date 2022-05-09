import '../Data/Models/Event.dart';
import '../Data/Models/Proces.dart';

abstract class IDatabaseHandler {
  Future<List<Proces>> readProcesses(int cpr);
  Future<List<Event>> readAllEvents(int proces_id);
}
