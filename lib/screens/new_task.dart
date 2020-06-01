import 'package:flutter/material.dart';

class NewTaskScreen extends StatelessWidget {
  static const String id = 'new';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Task'),
            ),
          ],
        ),
      ),
    );
  }
}
