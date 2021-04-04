import 'package:flutter/material.dart';

class DecoratedInputField extends StatelessWidget {
  final String fieldName;
  final Color color;
  final TextInputType keyboardType;
  final TextEditingController controller;

  final int maxLines;
  final String Function(String) validator;
  DecoratedInputField(
      {this.keyboardType,
      this.color,
      this.controller,
      @required this.fieldName,
      this.maxLines = 1,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyText1,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
            labelText: fieldName,
            labelStyle: Theme.of(context).textTheme.headline4,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent))),
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
