import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class NoteModel {
//id in database will be generated automatically
  final String title;
  final String description;
  final String categories;
  final Timestamp date;
  NoteModel({
    @required this.title,
    @required this.description,
    @required this.categories,
    @required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'categories': categories,
      'date': date.toDate(),
    };
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromJson(json.decode(source));
}

class ListOfNotesModel extends ChangeNotifier {
  NoteModel noteAssign;
  List<NoteModel> notes = [];

  addNotes(
      {@required String title,
      @required String description,
      @required Timestamp date,
      @required String category}) {
    noteAssign = NoteModel(
        date: date,
        description: description,
        title: title,
        categories: category);
    //if priority is high assign it from top

    notes.add(noteAssign);
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
