import 'package:flutter/material.dart';

class AddNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _notesController = TextEditingController();

    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(),
        )
      ],
    ));
  }
}
