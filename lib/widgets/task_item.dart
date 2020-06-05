import 'package:flutter/material.dart';
import 'package:DoMyBidding/models/task.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:DoMyBidding/controllers/update_task.dart';
import 'package:DoMyBidding/widgets/task_details.dart';
import 'package:DoMyBidding/models/user_data.dart';
import 'package:DoMyBidding/models/filters.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Filter filter;

  TaskItem(this.task, this.filter);

  String dateToString(date) {
    DateTime timestampToDate = date.toDate();
    String formattedDate = DateFormat('dd-MM-yyyy').format(timestampToDate);
    return formattedDate;
  }

  String userName() {
    GetUserInfo().getUserName(task.createdBy).then((String result) {
      return result;
    });
  }

  Color priorityColour() {
    if (task.priority == 1) {
      return Colors.red;
    } else if (task.priority == 2) {
      return Colors.orange;
    } else if (task.priority == 3) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        UpdateTasks().deleteTask(task);
      },
      key: UniqueKey(),
      background: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: EdgeInsets.only(left: 20.0),
        color: Colors.red,
        child: FaIcon(
          FontAwesomeIcons.solidTrashAlt,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        alignment: AlignmentDirectional.centerEnd,
        padding: EdgeInsets.only(right: 20.0),
        color: Colors.red,
        child: FaIcon(
          FontAwesomeIcons.solidTrashAlt,
          color: Colors.white,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 1.0)),
//        border: Border.all(color: Colors.black, width: 1.0),
          color: Color.fromRGBO(239, 246, 224, 1.0),
        ),
        child: ListTile(
          onTap: () {
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return TaskDetails(task, filter);
                });
          },
          title: Text(
            task.task,
            style: TextStyle(color: priorityColour()),
          ),
          subtitle: Text(dateToString(task.dueDate)),
          trailing: Checkbox(
              value: task.completed,
              onChanged: (value) {
                if (filter == Filter.assignedToUser) {
                  UpdateTasks().taskComplete(task);
                } else {}
              }),
        ),
      ),
    );
  }
}
