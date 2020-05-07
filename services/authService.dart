import 'package:firebase_auth/firebase_auth.dart';
import 'package:fipstack/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFIrebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future signIn(String email, String password) async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      _userFromFIrebase(user);
      print("Signed in with Firebase UID: $user");
    } catch (e) {
      print("Error $e");
    }
  }

  // Stream for checking state of signing in
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFIrebase);
  }

  //Future signOut(){}

  //Future registerWithEmailAndPassword(){}

}
