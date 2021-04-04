import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_keeper/firebaseService/firestoreSeervice.dart';
import 'package:note_keeper/screens/addNotes.dart';
import 'package:note_keeper/widgets/cards.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirestoreService _firestore = Provider.of<FirestoreService>(context);
    final User _userData = FirebaseAuth.instance.currentUser;
    final CollectionReference _notesData = FirebaseFirestore.instance
        .collection('notes')
        .doc(_userData.email)
        .collection(_userData.email);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddNotes()));
          },
          backgroundColor: Colors.purple,
          child: Icon(
            Icons.add,
            size: 40,
            color: Theme.of(context).iconTheme.color,
          )),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notes',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 30),
                Text(
                  'Hello ' + _userData.displayName,
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 5),
                Text('here your notes',
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(height: 30),
                StreamBuilder(
                    stream: _notesData.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      return (snapshot.data != null)
                          ? (snapshot.data.docs.length != 0)
                              ? StaggeredGridView.countBuilder(
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  mainAxisSpacing: 20.0,
                                  crossAxisSpacing: 20.0,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: snapshot.data.docs.length,
                                  staggeredTileBuilder: (int index) =>
                                      StaggeredTile.fit(1),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return NotesCards(
                                      firestore: _firestore,
                                      email: _userData.email,
                                      docId: snapshot.data.docs[index].id,
                                      index: index,
                                      title: snapshot.data.docs[index]
                                          .data()['title'],
                                      date: snapshot.data.docs[index]
                                          .data()['date'],
                                      description: snapshot.data.docs[index]
                                          .data()['description'],
                                      category: snapshot.data.docs[index]
                                          .data()['categories'],
                                    );
                                  },
                                )
                              : Text('Sorry, no data avaialable',
                                  style: Theme.of(context).textTheme.headline3)
                          : Text('Sorry, no data avaialable',
                              style: Theme.of(context).textTheme.headline3);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
