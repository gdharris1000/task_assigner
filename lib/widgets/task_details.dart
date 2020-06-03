import 'package:flutter/material.dart';
import 'package:DoMyBidding/models/task.dart';
import 'package:intl/intl.dart';
import 'package:DoMyBidding/models/user_data.dart';
import 'package:DoMyBidding/controllers/update_taks.dart';

class TaskDetails extends StatefulWidget {
  final Task task;

  TaskDetails(this.task);

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  String userName = "";

  Text priority() {
    if (widget.task.priority == 1) {
      return Text('High');
    } else if (widget.task.priority == 2) {
      return Text("Medium");
    } else if (widget.task.priority == 3) {
      return Text("Low");
    } else {
      return Text('High');
    }
  }

  void getUserName() {
    GetUserInfo().getUserName(widget.task.createdBy).then((String result) {
      setState(() {
        userName = result;
      });
    });
  }

  String dateToString(date) {
    DateTime timestampToDate = date.toDate();
    String formattedDate = DateFormat('dd-MM-yyyy').format(timestampToDate);
    return formattedDate;
  }

  @override
  void initState() {
    getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.task.task),
      content: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Priority: '),
              priority(),
            ],
          ),
          SizedBox(height: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Due Date: '),
              Text(dateToString(widget.task.dueDate)),
            ],
          ),
          SizedBox(height: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Date Created: '),
              Text(dateToString(widget.task.created)),
            ],
          ),
          SizedBox(height: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Created by: '),
              Text(userName),
            ],
          ),
          SizedBox(height: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Completed: '),
              Checkbox(
                  value: widget.task.completed,
                  onChanged: (value) {
                    setState(() {
                      UpdateTasks().taskComplete(widget.task);
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
