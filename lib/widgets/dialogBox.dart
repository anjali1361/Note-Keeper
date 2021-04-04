import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:note_keeper/components/themesAndColor.dart';

class MssgDialog extends StatelessWidget {
  final String title;
  final String mssg;
  final BuildContext context;
  MssgDialog(
      {@required this.title, @required this.mssg, @required this.context});
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
        content: Text(mssg, style: Theme.of(context).textTheme.bodyText1),
        actions: [
          RawMaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              fillColor: kltPink,
              onPressed: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Got It !',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ))
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
