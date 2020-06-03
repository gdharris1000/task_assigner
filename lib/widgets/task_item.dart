import 'package:flutter/material.dart';
import 'package:DoMyBidding/models/task.dart';
import 'package:intl/intl.dart';
import 'package:DoMyBidding/controllers/update_taks.dart';
import 'package:DoMyBidding/widgets/task_details.dart';
import 'package:DoMyBidding/models/user_data.dart';

class TaskItem extends StatelessWidget {
  Task task;

  TaskItem(this.task);

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
      return Colors.amber;
    } else if (task.priority == 3) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return TaskDetails(task);
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
            UpdateTasks().taskComplete(task);
          }),
    );
  }
}
