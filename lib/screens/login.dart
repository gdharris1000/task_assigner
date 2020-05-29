import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Email address'),
              onChanged: (value) => email = value,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
              onChanged: (value) => password = value,
            ),
            RaisedButton(
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text('Log in'))
          ],
        ),
      ),
    );
  }
}
