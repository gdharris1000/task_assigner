import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

FirebaseUser loggedInUser;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  String name;
  String email;
  String password;

  void addToDatabase() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;

        try {
          final newUser = await _firestore.collection('users').add({
            'uid': loggedInUser.uid,
            'name': name,
            'created': Timestamp.now()
          });
        } catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: "Name"),
            onChanged: (value) {
              name = value;
            },
          ),
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
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);

                if (newUser != null) {
                  addToDatabase();
                }
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
