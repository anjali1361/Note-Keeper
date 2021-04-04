import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreService extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addNote(
      {@required String email,
      @required Map<String, dynamic> notesData}) async {
    try {
      CollectionReference notes = FirebaseFirestore.instance
          .collection('notes')
          .doc(email)
          .collection(email);
      await notes.add(notesData);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteNote({@required String docId, @required email}) async {
    try {
      CollectionReference notes = FirebaseFirestore.instance
          .collection('notes')
          .doc(email)
          .collection(email);
      await notes.doc(docId).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateNote(
      {@required docId,
      @required email,
      @required Map<String, dynamic> notesData}) async {
    CollectionReference notes = FirebaseFirestore.instance
        .collection('notes')
        .doc(email)
        .collection(email);
    await notes.doc(docId).update(notesData);
  }
}
