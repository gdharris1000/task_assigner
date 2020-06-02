import 'package:flutter/material.dart';
import 'screens/register.dart';
import 'screens/login.dart';
import 'screens/welcome.dart';
import 'screens/view_tasks.dart';
import 'screens/new_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Do My Bidding',
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        TasksScreen.id: (context) => TasksScreen(),
      },
    );
  }
}
