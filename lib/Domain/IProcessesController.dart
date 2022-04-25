import 'package:eventlog/Data/Proces.dart';

abstract class IProcessesController {
  Future<List<Proces>> getProcesses(int cpr);
  List<Proces> sortProcesses(List<Proces> list);
}
