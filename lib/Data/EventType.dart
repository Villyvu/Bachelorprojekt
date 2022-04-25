class EventType {
  final String _titel;
  final String _description;

  EventType(this._titel, this._description);

  String getTitel() {
    return this._titel;
  }

  String getDescription() {
    return this._description;
  }

  EventType.fromMap(Map<String, dynamic> map)
      : _titel = map['_titel'],
        _description = map['_description'];
}
