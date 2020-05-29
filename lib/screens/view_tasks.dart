import 'package:DoMyBidding/streams/task_stream.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  static const String id = 'tasks';
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            child: Text('Welcome'),
          ),
          TaskStream(),
        ],
      ),
    );
  }
}
