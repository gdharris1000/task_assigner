import 'package:TaskAssigner/screens/view_tasks.dart';
import 'package:TaskAssigner/screens/home.dart';
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
      backgroundColor: Color.fromRGBO(174, 195, 176, 1.0),
      appBar: AppBar(title: Text('Login')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Image.asset('assets/images/logo.png'),
                ),
                flex: 2,
              ),
              SizedBox(height: 30.0),
              Flexible(
                flex: 5,
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
                          if (user != null) {
//                        Navigator.pushNamed(context, TasksScreen.id);
                            Navigator.pushNamed(context, HomeScreen.id);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text('Log in'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
