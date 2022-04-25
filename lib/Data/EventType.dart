class EventType {
  final String _titel;
  final String _description;

  get titel => this._titel;

  get description => this._description;

  EventType(this._titel, this._description);

  EventType.fromMap(Map<String, dynamic> map)
      : _titel = map['_titel'],
        _description = map['_description'];
}
