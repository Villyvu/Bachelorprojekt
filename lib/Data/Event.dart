import 'dart:convert';

// ignore_for_file: unused_field

class Event {
  DateTime _dateTime;
  String _typeOfEvent;
  String _description;

  Event(this._dateTime, this._typeOfEvent, this._description);

  get getDateTime => this._dateTime;

  set setDateTime(DateTime dateTime) {
    this._dateTime = dateTime;
  }

  String get getTypeOfEvent => this._typeOfEvent;

  set setTypeOfEvent(String value) {
    this._typeOfEvent = value;
  }

  get getDescription => this._description;

  set setDescription(String value) {
    this._description = value;
  }
}
