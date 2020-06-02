import 'package:DoMyBidding/screens/new_task.dart';
import 'package:DoMyBidding/screens/register.dart';
import 'package:DoMyBidding/streams/task_stream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseUser loggedInUser;

class TasksScreen extends StatefulWidget {
  static const String id = 'tasks';
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewTaskScreen())),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('Welcome'),
            ),
            Expanded(child: TaskStream()),
          ],
        ),
      ),
    );
  }
}
