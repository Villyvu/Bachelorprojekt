import '../Data/Models/Proces.dart';

abstract class IProcessesController {
  Future<List<Proces>> getProcesses(int cpr);
  List<Proces> sortProcesses(List<Proces> list);
}
