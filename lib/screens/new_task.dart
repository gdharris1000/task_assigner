import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class NewTaskScreen extends StatefulWidget {
  static const String id = 'new';

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  String priority = '1 - High';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Task'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Due Date'),
              onTap: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    maxTime: DateTime(2100, 1, 1), onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
            ),
            DropdownButton<String>(
              value: priority,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (value) {
                setState(() {
                  priority = value;
                });
              },
              items: <String>['1 - High', '2 - Medium', '3 -Low']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
