import 'package:DoMyBidding/screens/new_task.dart';
import 'package:DoMyBidding/streams/task_stream.dart';
import 'package:flutter/material.dart';
import 'package:DoMyBidding/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:DoMyBidding/models/filters.dart';
import 'package:DoMyBidding/screens/task_status.dart';

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
      appBar: AppBar(
        title: Text('Your tasks'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewTaskScreen())),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child: TaskStream(currentUser, Filter.assignedToUser)),
          ],
        ),
      ),
    );
  }
}
