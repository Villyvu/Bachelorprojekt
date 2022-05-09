import 'package:eventlog/Data/datasources/ISql_Database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb implements ISqlDatabase {
  Database database;

  SqlDb(Database this.database);

  @override
  Future<List<Map<String, Object?>>> readAllEvents(int proces_id) async {
    print('Reading all Events ' + proces_id.toString());
    final Database db = database;
    final List<Map<String, Object?>> queryResult = await db.rawQuery(
        'SELECT proces_id, _datetime, _titel, _description, _icon  FROM event INNER JOIN eventtype on eventtype._typeOfEvent_id = event._typeOfEvent_id WHERE proces_id = ?',
        [proces_id]);
    return queryResult;
  }

  @override
  Future<List<Map<String, Object?>>> readProcesses(int cpr) async {
    await Future.delayed(Duration(seconds: 1));
    print('Reading Processes');
    final Database db = database;
    final List<Map<String, Object?>> queryResult = await db
        .query('proces', columns: null, where: 'cpr = ?', whereArgs: [cpr]);
    return queryResult;
  }

  void deleteTable() async {
    await Future.delayed(Duration(seconds: 3));
    final Database db = database;
    db.rawDelete('DROP TABLE proces');
    //db.rawDelete('DROP TABLE eventType');
    //db.rawDelete('DROP TABLE event');
    print("tables deleted");
  }

  void createTables() async {
    String procesTable =
        "CREATE TABLE IF NOT EXISTS proces(proces_id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT NOT NULL, caretaker TEXT NOT NULL, cpr INTEGER NOT NULL)";
    String eventTypeTable =
        "CREATE TABLE IF NOT EXISTS eventType(_typeOfEvent_id INTEGER PRIMARY KEY AUTOINCREMENT, _titel TEXT NOT NULL, _description TEXT NOT NULL, _icon INTERGER NOT NULL)";
    String eventTable =
        "CREATE TABLE IF NOT EXISTS event(proces_id INTEGER NOT NULL, _dateTime TEXT NOT NULL, _typeOfEvent_id INTEGER NOT NULL, FOREIGN KEY (proces_ID) REFERENCES proces, FOREIGN KEY (_typeOfEvent_id) REFERENCES eventType)";
    final Database db = database;
    await db.execute(procesTable);
    await db.execute(eventTypeTable);
    await db.execute(eventTable);

    print("Tables created");
  }

  void fillTable() async {
    final Database db = await database;

    db.rawInsert(
        'INSERT INTO proces(date, caretaker, cpr) VALUES(datetime("now"), "John Doe", 0123456789)');
    /*
    db.rawInsert(
        'INSERT INTO proces(date, caretaker, cpr) VALUES(datetime("now"), "John Doe", 0123456789)');
    

    db.rawInsert(
        'INSERT INTO proces(date, caretaker, cpr) VALUES(?,?,?)', ['2022-06-28 16:05:00', "John Doe", 0123456789]);
    
    db.rawInsert(
        'INSERT INTO proces(date, caretaker, cpr) VALUES(?,?,?)', ['2022-02-04 16:05:00', "John Doe", 0123456789]); 

    db.rawInsert(
        'INSERT INTO proces(date, caretaker, cpr) VALUES(?,?,?)', ['2022-03-18 16:05:00', "John Doe", 0123456789]);   
    */
    /*

    db.rawInsert(
        'INSERT INTO eventType(_titel, _description, _icon) VALUES(?,?,?)', [
      'Modtagelse af sygeplejerske',
      'Du er ankommet til Fælles Akutmodtagelse og blevet indregistreret i systemet. En sygeplejerske har taget imod dig på en stue, samt spurgt nærmere ind til din skade/sygdom og grunden til du er her. Sygeplejersken bruger nu den information du har afgivet, til at bestemme en passende behandlingsplan',
      0xe396
    ]);

    db.rawInsert(
        'INSERT INTO eventType(_titel, _description, _icon) VALUES(?,?,?)', [
      'COVID-19 screening',
      'Da COVID-19 stadig fylder en del i det danske samfund, er det derfor nødvendigt at teste alle patienter der kommer ind på FAM. Det er et vigtigt led i behandlingen, da eventuel smitte af andre akutte patienter, kan have store konsekvenser.',
      0xf4b1
    ]);

    db.rawInsert(
        'INSERT INTO eventType(_titel, _description, _icon) VALUES(?,?,?)', [
      'Klinisk vurdering',
      'En læge har nu vurderet omfanget af din skade/sygdom og har nu en behandlingsplan klar til dig. Lægen har præsenteret sig og fortalt om de planlagte aktiviteter du skal igennem, for at kunne blive rask igen.',
      0xf11f
    ]);

    db.rawInsert(
        'INSERT INTO eventType(_titel, _description, _icon) VALUES(?,?,?)', [
      'LAB-pakke',
      'En LAB-pakke involverer at du får taget en blodprøve. En blodprøve tages ved, at der føres en nål gennem huden og ind i en blodåre, hvorefter en lille (ikke skadelig) mængden blod udtrækkes. Blodprøver bruges til et utal af formål, men som ofte for at måle mængden af salte, sukker, proteiner og enzymer i blodet. Det kan også være for at teste for eventuel bakteriel infektion i blodet.',
      0xf02c
    ]);

    db.rawInsert(
        'INSERT INTO eventType(_titel, _description, _icon) VALUES(?,?,?)', [
      'EKG',
      'Hvis du har fået en EKG (Elektrokardiogram) test, er det for at få nærmere indblik i hjertets rytme. Med en EKG test registrerer man de elektriske impulser som sendes gennem hjertet og som sørger for at hjertet slår regelmæssigt. Dette er som regel for at afkræfte eller bekræfte en mulig diagnose.',
      0xf76d
    ]);

    db.rawInsert(
        'INSERT INTO eventType(_titel, _description, _icon) VALUES(?,?,?)', [
      'Røntgenundersøgelse',
      'Hvis du har fået en EKG (Elektrokardiogram) test, er det for at få nærmere indblik i hjertets rytme. Med en EKG test registrerer man de elektriske impulser som sendes gennem hjertet og som sørger for at hjertet slår regelmæssigt. Dette er som regel for at afkræfte eller bekræfte en mulig diagnose.',
      0xefe1
    ]);

    db.rawInsert(
        'INSERT INTO eventType(_titel, _description, _icon) VALUES(?,?,?)', [
      'Primærjournal',
      'Hvis din indlæggelsestid overskrider 24 timer, vil der blive skrevet en primærjournal. Det involverer ikke direkte dig, men det er nødvendigt for dit videre ophold, da primærjournal som oftest skrives, hvis din indlæggelse varer mere end ét døgn eller du skal flyttes til en anden afdeling.',
      0xf04f6
    ]);

    db.rawInsert(
        'INSERT INTO eventType(_titel, _description, _icon) VALUES(?,?,?)', [
      '4-timers plan',
      'Ved en 4-timers plan har du været akut indlagt i nogle timer og der gives her en status på dit behandlingsforløb og din skade/sygdom. Selve informationen afgives som regel af en praktiserende læge.',
      0xe662
    ]);

    db.rawInsert(
        'INSERT INTO event(proces_id, _dateTime, _typeOfEvent_id) VALUES(?, ?, ?)',
        [1, '2022-04-28 10:05:00', 1]);

    db.rawInsert(
        'INSERT INTO event(proces_id, _dateTime, _typeOfEvent_id) VALUES(?, ?, ?)',
        [1, '2022-04-28 12:05:00', 2]);

    db.rawInsert(
        'INSERT INTO event(proces_id, _dateTime, _typeOfEvent_id) VALUES(?, ?, ?)',
        [1, '2022-04-28 14:05:00', 3]);
    db.rawInsert(
        'INSERT INTO event(proces_id, _dateTime, _typeOfEvent_id) VALUES(?, ?, ?)',
        [1, '2022-04-28 16:05:00', 4]);
    db.rawInsert(
        'INSERT INTO event(proces_id, _dateTime, _typeOfEvent_id) VALUES(?, ?, ?)',
        [1, '2022-04-28 18:05:00', 6]);
    print("Data added");
    */
  }
}
