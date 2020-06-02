import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:DoMyBidding/models/task.dart';
import 'package:DoMyBidding/widgets/task_item.dart';

final _firestore = Firestore.instance;

class TaskStream extends StatelessWidget {
  final String uid;

  TaskStream(this.uid);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('tasks').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print('no task stream data');
            return Center(
              child: Text('Loading'),
            );
          } else {
            List<Task> taskList = [];
            final tasks = snapshot.data.documents.reversed;

            for (var taskData in tasks) {
              if (taskData.data['assigned_to'] == uid) {
                taskList.add(Task(
                    task: taskData.data['task'],
                    docId: taskData.documentID,
                    dueDate: taskData.data['due_date'],
                    assignedTo: taskData.data['assigned_to'],
                    createdBy: taskData.data['created_by'],
                    created: taskData.data['created'],
                    completed: taskData.data['completed'],
                    priority: taskData.data['priority']));
              }
            }
            return ListView.builder(
                itemBuilder: (context, index) {
                  final task = taskList[index];
                  return TaskItem(task);
                },
                itemCount: taskList.length);
          }
        });
  }
}
