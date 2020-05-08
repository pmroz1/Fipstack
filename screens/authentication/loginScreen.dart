import 'package:fipstack/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fipstack/services/authService.dart';
import 'package:fipstack/screens/authentication/registerScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String _email = '';
  String _password = "";

  bool validateForms() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print("Form is legit. @: $_email :: Password: $_password");
      return true;
    } else {
      print("Form is not legit");
      return false;
    }
  }

  Future tryToSignIn() async {
    if (validateForms()) {
      //loading
      dynamic result = await _auth.signIn(_email, _password);
      if (result == null) {
        print("Couldn't sign in");
        return null;
      }
    }
  }

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
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Container(
                    child: Image.asset("assets/people.png"),
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    decoration: formInputDecoration.copyWith(hintText: 'email'),
                    validator: (val) => (val.isEmpty) ? "Enter email" : null,
                    autocorrect: true,
                    onSaved: (val) => _email = val,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration:
                        formInputDecoration.copyWith(hintText: 'password'),
                    validator: (val) => (val.isEmpty) ? 'Enter password' : null,
                    autocorrect: true,
                    onSaved: (val) => _password = val,
                    obscureText: true,
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
                        onPressed: tryToSignIn,
                        child: Text("Log in")),
                  ),
                  //SizedBox(heig
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          )
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              "not a member?  ",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(color: yellow, fontSize: 22.0),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
