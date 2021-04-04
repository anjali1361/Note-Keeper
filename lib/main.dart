import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_keeper/components/themes.dart';
import 'package:note_keeper/firebaseService/firestoreSeervice.dart';
import 'package:note_keeper/models/note.dart';
import 'package:note_keeper/screens/signIn.dart';
import 'package:provider/provider.dart';
import 'screens/note_list.dart';
import 'firebaseService/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Text('someThingsWentWrong'),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return AppThemes();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class AppThemes extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FirestoreService>(
              create: (context) => FirestoreService()),
          ChangeNotifierProvider<ListOfNotesModel>(
              create: (context) => ListOfNotesModel()),
          Provider<AuthProvider>(
              create: (context) => AuthProvider(FirebaseAuth.instance)),
          StreamProvider(
            create: (context) => context.read<AuthProvider>().authStateChanges,
            initialData: user,
          )
        ],
        child: MaterialApp(
            title: "NoteKeeper",
            theme: CustomThemeData.lightTheme(context),
            darkTheme: CustomThemeData.darkTheme(context),
            home: Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                body: AuthWidget())));
  }
}

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Instance to know the authentication state.
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) return Home();

    return SignIn();
  }
}
