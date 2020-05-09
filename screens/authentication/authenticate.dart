import 'package:fipstack/screens/authentication/loginScreen.dart';
import 'package:fipstack/screens/authentication/registerScreen.dart';
import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn ? LoginScreen(toggleView: toggleView,) : RegisterScreen(toggleView: toggleView);
  }
}