import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:DoMyBidding/widgets/task_item.dart';
import 'package:mockito/mockito.dart';
import 'package:DoMyBidding/models/task.dart';
import 'package:DoMyBidding/models/filters.dart';

final Timestamp time = Timestamp.fromMicrosecondsSinceEpoch(1590756181000);

class FakeTask extends Fake implements Task {
  final String docId = '1';
  final String task = 'Eat crisps';
  final String assignedTo = 'bob';
  final String createdBy = 'pob';
  final Timestamp created = time;
  final Timestamp dueDate = time;
  final int priority = 1;
  bool completed = false;
}

var task = FakeTask();

void main() {
  testWidgets('Task Item Widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: TaskItem(task, Filter.assignedToUser),
        ),
      ),
    );

    final taskFinder = find.text('Eat crisps');

    expect(taskFinder, findsOneWidget);
  });
}
