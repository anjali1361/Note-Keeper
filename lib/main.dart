import 'package:flutter/material.dart';
import 'package:note_keeper/models/note.dart';
import 'package:provider/provider.dart';
import './screens/note_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListOfNotesModel>(
            create: (context) => ListOfNotesModel()),
      ],
      child: MaterialApp(
        title: "NoteKeeper",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: NotesListView(),
      ),
    );
  }
}
