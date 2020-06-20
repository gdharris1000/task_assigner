import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:TaskAssigner/screens/home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:TaskAssigner/mixins/validation_mixin.dart';

final _firestore = Firestore.instance;

FirebaseUser loggedInUser;

class RegisterScreen extends StatefulWidget {
  static const String id = 'register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with ValidationMixin {
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String name;
  String email;
  String password;
  String passwordCheck;

  void addToDatabase() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;

        try {
          await _firestore.collection('users').add({
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
        backgroundColor: Color.fromRGBO(174, 195, 176, 1.0),
        appBar: AppBar(
          title: Text('Register'),
        ),
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
                Form(
                  key: formKey,
                  child: Flexible(
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(hintText: "Name"),
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: "Email address"),
                          onChanged: (value) {
                            email = value;
                          },
                          validator: emailValidator,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Password"),
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                          },
                          validator: passwordValidator,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: "Confirm password"),
                          obscureText: true,
                          onChanged: (value) {
                            passwordCheck = value;
                          },
                          validator: (value) {
                            if (value != password) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        RaisedButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);

                                if (newUser != null) {
                                  addToDatabase();
                                  Navigator.pushNamed(context, HomeScreen.id);
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: Text('Register'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
