import 'package:fipstack/screens/authentication/authenticate.dart';
import 'package:fipstack/screens/logged/homeWrapper.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:fipstack/screens/logged/homeScreen.dart';
import 'package:fipstack/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user == null ? Authenticate() : HomeWrapper();
  }
}
