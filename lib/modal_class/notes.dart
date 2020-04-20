class Note {
  String _id;
  String _title;
  String _description;
  String _date;
  int _priority;
  Map<String, double> _meta;

  Note(this._title, this._date, this._priority,
      [this._description, this._meta]);

  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description, this._meta]);

  String get id => _id;

  String get title => _title;

  String get description => _description;

  int get priority => _priority;

  String get date => _date;

  Map<String, double> get meta => _meta;

  set id(String id) {
    this._id = id;
  }

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    this._description = newDescription;
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 3) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  set meta(Map<String, double> newMeta) {
    this._meta = newMeta;
  }
}