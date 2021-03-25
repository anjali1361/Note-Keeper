import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;

  AuthProvider(this._firebaseAuth);
  final FirebaseAuth userAuth = FirebaseAuth.instance;
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  User getUserId() {
    final User userId = userAuth.currentUser;

    return userId;
  }

  Future<String> googleSignIn() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // _firebaseAuth.authStateChanges();

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);

      return "True";
    } catch (e) {
      return e;
    }
  }

  Future<String> signOut() async {
    await _firebaseAuth.signOut();
    return "signed Out";
  }
}
