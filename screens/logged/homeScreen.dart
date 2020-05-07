import 'package:fipstack/shared/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Container(
        child: Column(
          children: <Widget>[Text("You are logged in :D")],
        ),
      ),
    );
  }
}
