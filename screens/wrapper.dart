import 'package:fipstack/models/user.dart';
import 'package:fipstack/screens/authentication/loginScreen.dart';
import 'package:fipstack/services/authService.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:fipstack/screens/logged/homeScreen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return home or authenticate based on user authentication
    if (user == null){
      return LoginScreen();
    }else{
      return HomeScreen();
    }
  }
}
