import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String docId;
  final String task;
  final String assignedTo;
  final String createdBy;
  final Timestamp created;
  final Timestamp dueDate;
  final int priority;
  bool completed;

  Task(
      {this.docId,
      this.task,
      this.assignedTo,
      this.created,
      this.createdBy,
      this.dueDate,
      this.priority,
      this.completed = false});
}
