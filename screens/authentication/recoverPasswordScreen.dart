//import 'package:feather_icons_flutter/feather_icons_flutter.dart';
//import 'package:fipstack/screens/authentication/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:fipstack/shared/constants.dart';

class RecoverPasswordScreen extends StatefulWidget {
  @override
  _RecoverPasswordScreenState createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: appBackgroundColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
                  child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Reset passwod",
                  style: titleStyle,
                ),
                Text(
                  "Please enter your email addres to ",
                  style: smallText,
                ),
                Text(
                  "request password recovery",
                  style: smallText,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: formInputDecoration.copyWith(hintText: "Email"),
                  validator: (val) => val.isEmpty ? "Enter email" : null,
                  onSaved: (val) {
                    setState(() {
                      _email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
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
                       //todo
                      },
                      child: Text("Recover password")),
                ),
                SizedBox(height: 20,),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 50,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      color: white,
                      textColor: Colors.black,
                      onPressed: () async {
                       //todo
                      },
                      child: Text("Cancel")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
