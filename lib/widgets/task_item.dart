import 'package:flutter/material.dart';
import 'package:DoMyBidding/models/task.dart';

class TaskItem extends StatelessWidget {
  Task task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(task.task),
      subtitle: Text(task.dueDate.toString()),
      value: task.completed,
      onChanged: (value) {
        print('hi');
      },
    );
  }
}
