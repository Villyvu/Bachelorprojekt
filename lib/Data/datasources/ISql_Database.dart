abstract class ISqlDatabase {
  Future<List<Map<String, Object?>>> readProcesses(int cpr);
  Future<List<Map<String, Object?>>> readAllEvents(int proces_id);
}
