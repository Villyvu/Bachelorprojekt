import 'package:eventlog/Data/Event.dart';
import 'package:eventlog/Data/IProces.dart';

class Proces implements IProces {
  //List<Event> events;
  String caretaker;
  int cpr;
  String date;
  int proces_id;

  //Proces(this.events, this.caretaker, this.cpr, this.date, this.procesID);
  Proces(this.proces_id, this.date, this.caretaker, this.cpr);

/*  @override
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
*/
  Proces.fromMap(Map<String, dynamic> map)
      : proces_id = map['proces_id'],
        date = map['date'],
        caretaker = map['caretaker'],
        cpr = map['cpr'];
}
