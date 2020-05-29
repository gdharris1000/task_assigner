import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String task;
  final String assignedTo;
  final String createdBy;
  final Timestamp created;
  final Timestamp dueDate;
  bool completed;

  Task(
      {this.task,
      this.assignedTo,
      this.created,
      this.createdBy,
      this.dueDate,
      this.completed = false});
}
