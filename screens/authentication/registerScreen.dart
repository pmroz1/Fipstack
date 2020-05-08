import 'package:fipstack/shared/constants.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  var spaceBettwenForms = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBackgroundColor,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Join Fipstack",
                      style: titleStyle,
                    ),
                  ],
                ),
                TextFormField(
                    decoration: formInputDecoration.copyWith(hintText: 'Name'),
                    validator: (val) => val.isEmpty ? 'Name missing' : null,
                    autocorrect: true,
                    onSaved: (val) {
                      print("name field");
                    }),
                SizedBox(height: spaceBettwenForms),
                TextFormField(
                    decoration: formInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty ? 'Email missing' : null,
                    autocorrect: true,
                    onSaved: (val) {
                      print("name field");
                    }),
                SizedBox(height: spaceBettwenForms),
                TextFormField(
                    decoration:
                        formInputDecoration.copyWith(hintText: 'Password'),
                    obscureText: true,
                    validator: (val) => val.isEmpty ? 'Password missing' : null,
                    autocorrect: true,
                    onSaved: (val) {
                      print("name field");
                    }),
                SizedBox(height: spaceBettwenForms),
                Text(
                  "By creating account i accept the following:",
                  style: titleStyle.copyWith(fontSize: 15),
                ),
                Text(
                  "Terms of service",
                  style: smallText,
                ),
                Text(
                  "Privacy of policu",
                  style: smallText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
