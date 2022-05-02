import 'package:eventlog/Data/Db/IDatabaseHandler.dart';
import 'package:eventlog/Data/Proces.dart';
import 'package:eventlog/Domain/IProcessesController.dart';
import 'package:sqflite/sqflite.dart';

class ProcessesController implements IProcessesController {
  late IDatabaseHandler databaseHandler;

  ProcessesController(IDatabaseHandler instance) {
    databaseHandler = instance;
    

  }

  @override
  Future<List<Proces>> getProcesses(int cpr) async {
    return databaseHandler.readProcesses(cpr);
  }

  @override
  List<Proces> sortProcesses(List<Proces> list) {
    List<Proces> tempList = list;
    tempList.sort(
      (a, b) {
        return DateTime.parse(b.date).compareTo(DateTime.parse(a.date));
      },
    );
    return tempList;
  }
}
