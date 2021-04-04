import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_keeper/firebaseService/firestoreSeervice.dart';

class NotesCards extends StatelessWidget {
  const NotesCards({
    @required this.firestore,
    @required this.email,
    @required this.index,
    @required this.docId,
    @required this.date,
    @required this.title,
    @required this.description,
    @required this.category,
  });

  final FirestoreService firestore;
  final String email;
  final int index;
  final String docId;
  final String title;
  final Timestamp date;
  final String description;

  final String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      onLongPress: () async {
        await firestore.deleteNote(docId: docId, email: email);
      },
      child: Ink(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            DateFormat.yMMMd().format(date.toDate()),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            margin: EdgeInsets.only(top: 5),
            child: Text(
              category,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ]),
      ),
    );
  }
}
