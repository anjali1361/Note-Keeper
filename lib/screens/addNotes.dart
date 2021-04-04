import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_keeper/firebaseService/firestoreSeervice.dart';
import 'package:note_keeper/models/note.dart';
import 'package:note_keeper/widgets/inputField.dart';
import 'package:provider/provider.dart';
import 'package:note_keeper/components/themesAndColor.dart';
import 'package:note_keeper/widgets/dialogBox.dart';

class AddNotes extends StatefulWidget {
  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  String _selectedItems = 'none';
  final User user = FirebaseAuth.instance.currentUser;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final FirestoreService _firestore = Provider.of<FirestoreService>(context);
    final List<DropdownMenuItem> _items = [
      DropdownMenuItem(
          value: 'Work',
          child: Text(
            'Work',
            style: Theme.of(context).textTheme.bodyText1,
          )),
      DropdownMenuItem(
          value: 'Life',
          child: Text(
            'Life',
            style: Theme.of(context).textTheme.bodyText1,
          )),
      DropdownMenuItem(
          value: 'Home',
          child: Text(
            'Home',
            style: Theme.of(context).textTheme.bodyText1,
          )),
      DropdownMenuItem(
          value: 'Assignment',
          child: Text(
            'Assignment',
            style: Theme.of(context).textTheme.bodyText1,
          )),
      DropdownMenuItem(
          value: 'To-Do',
          child: Text(
            'To-DO',
            style: Theme.of(context).textTheme.bodyText1,
          )),
      DropdownMenuItem(
          value: 'Goals',
          child: Text(
            'Goals',
            style: Theme.of(context).textTheme.bodyText1,
          )),
      DropdownMenuItem(
          value: 'Travel',
          child: Text(
            'Travel',
            style: Theme.of(context).textTheme.bodyText1,
          )),
      DropdownMenuItem(
          value: 'Money',
          child: Text(
            'Money',
            style: Theme.of(context).textTheme.bodyText1,
          )),
      DropdownMenuItem(
          value: 'Random',
          child: Text(
            'Random',
            style: Theme.of(context).textTheme.bodyText1,
          )),
    ];

    final Size screeenSize = MediaQuery.of(context).size;
    _alertDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return MssgDialog(
              context: context,
              mssg: 'Fields Are Empty',
              title: 'Alert',
            );
          });
    }

    _addNotes(
        {@required String title,
        @required String description,
        @required String category}) async {
      NoteModel notesData = NoteModel(
          title: title,
          description: description,
          categories: category,
          date: Timestamp.now());
      await _firestore.addNote(email: user.email, notesData: notesData.toMap());
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Add Your Notes',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(height: screeenSize.height * 0.1),
              DecoratedInputField(
                  fieldName: 'Title', controller: _titleController),
              DecoratedInputField(
                  fieldName: 'Notes',
                  controller: _notesController,
                  maxLines: 4),
              SizedBox(height: 20),
              Text(
                _selectedItems,
                style: Theme.of(context).textTheme.headline4,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: DropdownButton(
                  dropdownColor: Theme.of(context).cardColor,
                  hint: Text(
                    _selectedItems,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  items: _items,
                  onChanged: (value) {
                    setState(() {
                      _selectedItems = value;
                      print(_selectedItems);
                    });
                  },
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(height: 40),
              GradientButton(
                  onTap: () async {
                    print(_selectedItems);
                    (_notesController.text.isNotEmpty &&
                            _notesController.text.isNotEmpty &&
                            _selectedItems != 'none')
                        ? _addNotes(
                            title: _titleController.text.trim(),
                            description: _notesController.text.trim(),
                            category: _selectedItems)
                        : _alertDialog();
                  },
                  label: 'Add Notes'),
              SizedBox(height: 40),
              GradientButton(
                onTap: () => Navigator.pop(context),
                label: 'Go Back',
              )
            ],
          ),
        )),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  GradientButton({@required this.onTap, @required this.label});
  final Function onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.topLeft,
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [kdkPink, kltPink],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
        ),
      ),
    );
  }
}
