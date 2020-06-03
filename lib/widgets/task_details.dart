import 'package:flutter/material.dart';
import 'package:DoMyBidding/models/task.dart';
import 'package:intl/intl.dart';

class TaskDetails extends StatelessWidget {
  final Task task;

  TaskDetails(this.task);

  Text priority() {
    if (task.priority == 1) {
      return Text('High');
    } else if (task.priority == 2) {
      return Text("Medium");
    } else if (task.priority == 3) {
      return Text("Low");
    }
  }

  String dateToString(date) {
    DateTime timestampToDate = date.toDate();
    String formattedDate = DateFormat('dd-MM-yyyy').format(timestampToDate);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(task.task),
      content: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Priority: '),
              priority(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Due Date: '),
              Text(dateToString(task.dueDate)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Date Created: '),
              Text(dateToString(task.created)),
            ],
          ),
        ],
      ),
    );
  }
}
