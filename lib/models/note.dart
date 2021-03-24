import 'package:flutter/cupertino.dart';

class Note {
  int _id; //id in database will be generated automatically
  String _title;
  String _description;
  String _date;
  int _priority;

  Note(this._title, this._date, this._priority,
      [this._description]); //_description here is optional parameter
  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description]);

  int get id => _id; //getter methods for all instance variable
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDesc) {
    if (newDesc.length <= 255) {
      this._description = newDesc;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    if (newDate.length <= 255) {
      this._date = newDate;
    }
  }

  //convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    //dynamic type will work for both int and String entries
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }

    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  //Extract a Note object from a map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}

class NoteModel {
//id in database will be generated automatically
  final String title;
  final String description;
  final DateTime date;
  final bool highPriority;
  NoteModel(
      {@required this.date,
      @required this.description,
      @required this.highPriority,
      @required this.title});
}

class ListOfNotesModel extends ChangeNotifier {
  NoteModel noteAssign;
  List<NoteModel> notes = [
    NoteModel(
        date: DateTime.now(),
        description:
            'Description of the notes to this and more useless talks to devert from me and any other thigs ihd he notes to this and more useless he notes to this and more useless ',
        highPriority: true,
        title: 'Some Title'),
    NoteModel(
        date: DateTime.now(),
        description:
            'Description of the notes to tes to this and more useless he notes to this and more useless ',
        highPriority: true,
        title: 'Some Title'),
    NoteModel(
        date: DateTime.now(),
        description:
            'Description of the notes to ihd he notes to this and more useless he notes to this and more useless ',
        highPriority: true,
        title: 'Some Title')
  ];
  demoAddNotes() {
    NoteModel demoNotes = NoteModel(
        date: DateTime.now(),
        description: 'Description of the notes',
        highPriority: true,
        title: 'Some Title');
    notes.add(demoNotes);
    notifyListeners();
  }

  addNotes(
      {@required String title,
      @required String description,
      @required bool highPriority,
      @required DateTime date}) {
    noteAssign = NoteModel(
        date: date,
        description: description,
        highPriority: highPriority,
        title: title);
    //if priority is high assign it from top
    (highPriority == true)
        ? notes.insert(0, noteAssign)
        : notes.add(noteAssign);
    notifyListeners();
  }

  deleteNote({@required int index}) {
    // notes.remove(index);
    notes.removeAt(index);
    print('oject removed at ' + index.toString());
    print('\n' + notes.length.toString());
    notifyListeners();
  }
}
