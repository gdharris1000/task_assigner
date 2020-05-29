import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: Text('Login'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
