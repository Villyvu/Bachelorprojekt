import 'dart:convert';

// ignore_for_file: unused_field

class Event {
  int proces_id;
  String _dateTime;
  String _titel;
  String _description;
  int _icon;

  get titel => this._titel;

  get description => this._description;

  get icon => this._icon;

  get procesid => this.proces_id;

  get dateTime => this._dateTime;

  Event(this.proces_id, this._dateTime, this._titel, this._description,
      this._icon);

  Event.fromMap(Map<String, dynamic> map)
      : proces_id = map['proces_id'],
        _dateTime = map['_dateTime'],
        _titel = map['_titel'],
        _description = map['_description'],
        _icon = map['_icon'];
}
