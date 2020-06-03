import 'package:flutter/material.dart';
import 'package:DoMyBidding/models/task.dart';

class TaskDetails extends StatelessWidget {
  final Task task;

  TaskDetails(this.task);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(task.task),
      content: Column(
        children: <Widget>[Text(task.priority.toString())],
      ),
    );
  }
}
