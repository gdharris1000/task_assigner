import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:DoMyBidding/models/task.dart';

final _firestore = Firestore.instance;

class UpdateTasks {
  void taskComplete(Task task) {
    _firestore.collection('tasks').document(task.docId).setData({
      'task': task.task,
      'assigned_to': task.assignedTo,
      'created': task.created,
      'created_by': task.createdBy,
      'due_date': task.dueDate,
      'priority': task.priority,
      'completed': task.completed = !task.completed
    });
  }

  void deleteTask(Task task) {
    _firestore.collection('tasks').document(task.docId).delete();
  }
}
