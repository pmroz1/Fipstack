import 'package:flutter/material.dart';
import 'package:fipstack/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'package:fipstack/services/authService.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
