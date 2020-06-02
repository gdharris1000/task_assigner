import 'package:DoMyBidding/screens/new_task.dart';
import 'package:DoMyBidding/streams/task_stream.dart';
import 'package:flutter/material.dart';
import 'package:DoMyBidding/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TasksScreen extends StatefulWidget {
  static const String id = 'tasks';
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final GetUserInfo getUserInfo = GetUserInfo();
  String currentUser = "";

  void getCurrentUser() {
    getUserInfo.getCurrentUser().then((FirebaseUser result) {
      setState(() {
        currentUser = result.uid;
        print(currentUser);
      });
    });
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

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
            Expanded(child: TaskStream(currentUser)),
          ],
        ),
      ),
    );
  }
}
