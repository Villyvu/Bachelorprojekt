import 'dart:convert';

// ignore_for_file: unused_field

class Event {
  int proces_id;
  String _dateTime;
  int _typeOfEvent_id;

  get procesid => this.proces_id;

  get dateTime => this._dateTime;

  get typeOfEvent_id => this._typeOfEvent_id;

  Event(this.proces_id, this._dateTime, this._typeOfEvent_id);

  Event.fromMap(Map<String, dynamic> map)
      : proces_id = map['proces_id'],
        _dateTime = map['_dateTime'],
        _typeOfEvent_id = map['_typeOfEvent_id'];
}
