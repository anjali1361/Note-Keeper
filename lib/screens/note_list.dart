import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_keeper/models/note.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notesList = Provider.of<ListOfNotesModel>(context);
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              // barrierColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                );
              });
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(
          Icons.add,
          size: 36,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ' + 'Notes',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 30),
                StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  physics: BouncingScrollPhysics(),
                  itemCount: notesList.notes.length,
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                  itemBuilder: (BuildContext context, int index) {
                    return (notesList.notes.length != 0)
                        ? InkWell(
                            splashColor: Colors.red,
                            onLongPress: () =>
                                notesList.deleteNote(index: index),
                            child: Ink(
                              decoration: BoxDecoration(
                                  color: Color(0xffeEeEeE),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notesList.notes[index].title,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                    Text(
                                      notesList.notes[index].description,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      notesList.notes[index].date.toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ]),
                            ),
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            color: Colors.red,
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
