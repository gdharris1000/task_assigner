import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class TaskStream extends StatelessWidget {
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
            final tasks = snapshot.data.documents.reversed;
            String taskName;
            for (var taskData in tasks) {
              print(taskData.data['task']);
              taskName = taskData.data['task'];
            }
            return Center(
              child: Text(taskName),
            );
          }
        });
  }
}
