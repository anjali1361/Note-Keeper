import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_keeper/components/themesAndColor.dart';

class CustomThemeData {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      backgroundColor: Colors.white,
      cardColor: kCardWhite,
      iconTheme: IconThemeData(color: kIconWhite),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: GoogleFonts.alef().fontFamily,
              fontSize: 28,
              color: ktextBlack,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
            fontFamily: GoogleFonts.alef().fontFamily,
            fontSize: 20,
            color: ktextGrey,
          ),
          headline3: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 18,
            color: ktextBlack,
          ),
          headline4: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 24,
            color: ktextBlack,
          ),
          bodyText1: TextStyle(
            fontFamily: GoogleFonts.alef().fontFamily,
            fontSize: 20,
            color: ktextGrey,
          ),
          bodyText2: TextStyle(
            fontFamily: GoogleFonts.alef().fontFamily,
            fontSize: 20,
            color: ktextWhite,
          ))
      // cardColor:
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      backgroundColor: Colors.black,
      cardColor: kCardBlack,
      iconTheme: IconThemeData(color: kIconBlack),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: GoogleFonts.alef().fontFamily,
              fontSize: 28,
              color: ktextWhite,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
            fontFamily: GoogleFonts.alef().fontFamily,
            fontSize: 20,
            color: ktextGrey,
          ),
          headline3: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 18,
              color: ktextWhite,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
          headline4: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 24,
            color: ktextWhite,
          ),
          bodyText1: TextStyle(
            fontFamily: GoogleFonts.alef().fontFamily,
            fontSize: 20,
            color: ktextGrey,
          ),
          bodyText2: TextStyle(
            fontFamily: GoogleFonts.alef().fontFamily,
            fontSize: 20,
            color: ktextWhite,
          )));
}
