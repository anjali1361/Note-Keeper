import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_keeper/animation/animation.dart';
import 'package:note_keeper/firebaseService/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthProvider>(context);

    Size _screenSize = MediaQuery.of(context).size;
    double _artboardSize = (_screenSize.height < _screenSize.width)
        ? _screenSize.height
        : _screenSize.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: _artboardSize,
                  width: _artboardSize,
                  child: OwlAnimation()),
              SizedBox(height: 30),
              Text(
                'Notes Keeper',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: GoogleFonts.aclonica().fontFamily,
                    fontSize: 28,
                    color: Color(0xffEeEeEe)),
              ),
              Text(
                'Always keep an eye\nof your notes',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: GoogleFonts.alef().fontFamily,
                    fontSize: 20,
                    color: Color(0xff777777)),
              ),
              SizedBox(height: 80),
              InkWell(
                  onTap: () async {
                    try {
                      String mssg = await authService.googleSignIn();

                      // await context.read<AuthProvider>().googleSignIn();
                    } catch (e) {
                      print(e.message);
                    }
                  },
                  child: Ink(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [Color(0xffAB0E86), Color(0xffE01171)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Text('Google SignIn',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: GoogleFonts.alef().fontFamily,
                                fontSize: 20,
                                color: Colors.white,
                              ))
                        ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
