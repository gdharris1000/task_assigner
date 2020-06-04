import 'package:flutter/material.dart';
import 'package:DoMyBidding/models/task.dart';
import 'package:intl/intl.dart';
import 'package:DoMyBidding/models/user_data.dart';
import 'package:DoMyBidding/controllers/update_task.dart';
import 'package:DoMyBidding/models/filters.dart';

class TaskDetails extends StatefulWidget {
  final Task task;
  final Filter filter;

  TaskDetails(this.task, this.filter);

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
      scrollable: true,
      title: Text(widget.task.task),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Priority: '),
              priority(),
            ],
          ),
          SizedBox(height: 20.0),
          Column(
            children: <Widget>[
              Text('Due Date: '),
              Text(dateToString(widget.task.dueDate)),
            ],
          ),
          SizedBox(height: 20.0),
          Column(
            children: <Widget>[
              Text('Date Created: '),
              Text(dateToString(widget.task.created)),
            ],
          ),
          SizedBox(height: 20.0),
          Column(
            children: <Widget>[
              Text('Created by: '),
              Text(userName),
            ],
          ),
          SizedBox(height: 20.0),
          Column(
            children: <Widget>[
              Text('Completed: '),
              Checkbox(
                  value: widget.task.completed,
                  onChanged: (value) {
                    setState(() {
                      if (widget.filter == Filter.assignedToUser) {
                        UpdateTasks().taskComplete(widget.task);
                      } else {}
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
