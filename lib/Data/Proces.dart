import 'package:eventlog/Data/Event.dart';
import 'package:eventlog/Data/IProces.dart';

class Proces implements IProces {
  List<Event> events;
  String caretaker;
  int cpr;
  DateTime date;
  int procesID;

  Proces(this.events, this.caretaker, this.cpr, this.date, this.procesID);

  @override
  void addEvent(Event event) {
    events.add(event);
  }

  @override
  void sortEvents() {
    events.sort(
      (a, b) {
        return a.getDateTime.compareTo(b.getDateTime);
      },
    );
  }
}
