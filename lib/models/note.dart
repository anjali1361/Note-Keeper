import 'package:flutter/cupertino.dart';

class NoteModel {
//id in database will be generated automatically
  final String title;
  final String description;
  final String categories;
  final DateTime date;
  final bool highPriority;
  NoteModel(
      {@required this.date,
      @required this.categories,
      @required this.description,
      @required this.highPriority,
      @required this.title});
}

class ListOfNotesModel extends ChangeNotifier {
  NoteModel noteAssign;
  List<NoteModel> notes = [];
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
        title: title,
        categories: '');
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
