import 'package:fipstack/shared/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(33, 35, 48, 1),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Container(
                    child: Image.asset("assets/people.png"),
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    decoration: formInputDecoration.copyWith(hintText: 'email'),
                    validator: (val) => (val.isEmpty) ? "email" : null,
                    autocorrect: true,
                    onChanged: null,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration:
                        formInputDecoration.copyWith(hintText: 'password'),
                    validator: (val) => (val.isEmpty) ? "email" : null,
                    autocorrect: true,
                    onChanged: null,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 169.0),
                      FlatButton(
                          //color: Colors.red,
                          textColor: Color.fromRGBO(170, 168, 168, 100),
                          onPressed: () => {print("button")},
                          child: Text("forgot password?"))
                    ],
                  ),
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 30,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        padding: EdgeInsets.all(8.0),
                        color: Colors.black,
                        textColor: Colors.white,
                        onPressed: () => {print("log in")},
                        child: Text("Log in?")),
                  ),
                  //SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Not a member?",
                        style: TextStyle(color: gre),
                      ),
                      FlatButton(
                          //color: Colors.red,
                          textColor: Color.fromRGBO(170, 168, 168, 100),
                          onPressed: () => {print("button")},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: yello),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
