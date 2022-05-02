import 'package:eventlog/Data/Event.dart';

class Proces {
  String _caretaker;
  int _cpr;
  String _date;
  int _proces_id;

  get caretaker => this._caretaker;

  get cpr => this._cpr;

  get date => this._date;

  get proces_id => this._proces_id;

  Proces(this._proces_id, this._date, this._caretaker, this._cpr);

  Proces.fromMap(Map<String, dynamic> map)
      : _proces_id = map['proces_id'],
        _date = map['date'],
        _caretaker = map['caretaker'],
        _cpr = map['cpr'];
}
