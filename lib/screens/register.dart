import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseUser loggedInUser;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: "Email address"),
            onChanged: (value) {
              email = value;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: "Password"),
            onChanged: (value) {
              password = value;
            },
          ),
          RaisedButton(
            onPressed: () async {
              try {
                await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
              } catch (e) {
                print(e);
              }
            },
            child: Text('Register'),
          )
        ],
      ),
    ));
  }
}
