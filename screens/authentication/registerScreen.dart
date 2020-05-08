import 'package:fipstack/screens/logged/homeScreen.dart';
import 'package:fipstack/services/authService.dart';
import 'package:fipstack/shared/constants.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool _goHome = false;

  var spaceBettwenForms = 15.0;

  String _email = '';
  String _password = '';

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

  Future tryToRegister() async {
    if (validateForms()) {
      dynamic result = await _auth.registerAccount(_email, _password);
      if(result != null){
        _goHome = true;
      }
      if (result == null) {
        print("Unable to create account");
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBackgroundColor,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
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
                      "Join Fipstack\n",
                      style: titleStyle,
                    ),
                  ],
                ),
                TextFormField(
                    decoration: formInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty ? 'Name missing' : null,
                    autocorrect: true,
                    onSaved: (val) {
                      setState(() => _email = val);
                    }),
                SizedBox(height: spaceBettwenForms),
                TextFormField(
                    decoration:
                        formInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val.isEmpty ? 'Email missing' : null,
                    autocorrect: true,
                    obscureText: true,
                    onSaved: (val) {
                      setState(() => _password = val);
                    }),
                SizedBox(height: spaceBettwenForms),
                TextFormField(
                    decoration: formInputDecoration.copyWith(
                        hintText: 'Repeat password'),
                    obscureText: true,
                    validator: (val) => val.isEmpty ? 'Password missing' : null,
                    autocorrect: true,
                    onSaved: (val) {
                      print("repeat password field");
                    }),
                SizedBox(height: spaceBettwenForms),
                Text(
                  "By creating account i accept the following:\n",
                  style: titleStyle.copyWith(fontSize: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Privacy of policy",
                      style: smallText,
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Terms of use", style: smallText),
                    ]),

                SizedBox(height: 100),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 50,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      color: Colors.black,
                      textColor: Colors.white,
                      onPressed: () async {
                        tryToRegister();
                        if (_goHome) {
                          _goHome = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        }
                      },
                      child: Text("Sign Up")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
