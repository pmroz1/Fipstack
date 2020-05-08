import 'package:firebase_auth/firebase_auth.dart';
import 'package:fipstack/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //print("Signed in with Firebase UID: $user");
      return user;
    } catch (e) {
      print("Error $e");
      return null;
    }
  }

  // Stream for checking state of signing in
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e);
    }
  }

  Future registerAccount(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //create new document for user with the uid
      
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  //Future signOut(){}

  //Future registerWithEmailAndPassword(){}

}
