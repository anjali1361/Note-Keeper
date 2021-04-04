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
      backgroundColor: Theme.of(context).backgroundColor,
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
              Text('Notes Keeper',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1),
              Text('Always keep an eye\nof your notes',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2),
              SizedBox(height: 80),
              GoogleAuthButton(authService: authService)
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({
    Key key,
    @required this.authService,
  }) : super(key: key);

  final AuthProvider authService;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          try {
            await authService.googleSignIn();

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
        ));
  }
}
