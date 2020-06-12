import 'package:TaskAssigner/screens/home.dart';
import 'package:flutter/material.dart';
import 'screens/register.dart';
import 'screens/login.dart';
import 'screens/welcome.dart';
import 'screens/view_tasks.dart';
import 'screens/task_status.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Do My Bidding',
      theme: ThemeData(
//        brightness: Brightness.dark,
//        backgroundColor: Color.fromRGBO(10, 54, 157, 1.0),
        primaryColor: Color.fromRGBO(18, 69, 89, 1.0),
        accentColor: Color.fromRGBO(18, 69, 89, 1.0),
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromRGBO(18, 69, 89, 1.0),
          textTheme: ButtonTextTheme.primary,
        ),
        toggleableActiveColor: Color.fromRGBO(18, 69, 89, 1.0),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        TasksScreen.id: (context) => TasksScreen(),
        TaskStatusScreen.id: (context) => TaskStatusScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
