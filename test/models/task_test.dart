import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:TaskAssigner/models/task.dart';

void main() {
  test('task setup', () {
    Timestamp time = Timestamp.fromMicrosecondsSinceEpoch(1590756181000);
    Task task = Task(
        docId: '1',
        task: 'Eat crisps',
        priority: 1,
        assignedTo: 'bob',
        createdBy: 'pob',
        created: time,
        dueDate: time);

    expect(task.docId, equals('1'));
    expect(task.task, equals('Eat crisps'));
    expect(task.assignedTo, equals('bob'));
    expect(task.createdBy, equals('pob'));
    expect(task.created, equals(time));
    expect(task.dueDate, equals(time));
    expect(task.priority, equals(1));
    expect(task.completed, equals(false));
  });
}
