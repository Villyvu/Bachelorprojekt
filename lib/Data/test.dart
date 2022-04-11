import 'package:eventlog/Data/Event.dart';
import 'package:eventlog/Data/Proces.dart';

void main() {
  Event event = Event(DateTime.now(), 'Udskrivelse', '123');
  Event event1 = Event(DateTime.parse("2022-04-01"), 'Blodprøve', '123');
  Event event2 = Event(DateTime.parse("2022-04-02"), 'Corona Screening', '123');
  List<Event> events = [];

  Proces proces = Proces(events, "Yusaf", 123123123, DateTime.now(), 1);

  proces.addEvent(event);
  proces.addEvent(event1);
  proces.addEvent(event2);

  for (var event in proces.events) {
    print("Hændelse: " +
        event.getTypeOfEvent +
        "  Start på hændelse: " +
        event.getDateTime.toString());
  }

  print("------------");
  proces.sortEvents();

  for (var event in proces.events) {
    print("Hændelse: " +
        event.getTypeOfEvent +
        "  Start på hændelse: " +
        event.getDateTime.toString());
  }
}
