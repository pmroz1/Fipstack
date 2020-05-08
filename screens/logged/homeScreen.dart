import 'package:fipstack/services/authService.dart';
import 'package:fipstack/shared/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              "You are logged in :D",
              style: TextStyle(fontSize: 50, color: Colors.red),
            ),
            FlatButton(
              child: Text("Log out"),
              color: Colors.red,
              onPressed: _auth.signOut,
            )
          ],
        ),
      ),
    );
  }
}
