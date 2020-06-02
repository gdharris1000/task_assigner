import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:DoMyBidding/streams/users_stream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:DoMyBidding/models/user_data.dart';

final _firestore = Firestore.instance;

class NewTaskScreen extends StatefulWidget {
  static const String id = 'new';

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  String priority = '1 - High';
  Timestamp dueDate = Timestamp.now();
  Timestamp created = Timestamp.now();
  GetUserInfo getUserInfo = GetUserInfo();
  bool completed = false;
  //String createdBy = loggedInUser.uid;
  String task = "";
  String userId = "";

  void currentUser() {
    getUserInfo.getCurrentUser().then((FirebaseUser result) {
      setState(() {
        userId = result.uid;
        print(userId);
      });
    });
  }

  @override
  void initState() {
    currentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Task'),
              onChanged: (value) {
                setState(() {
                  task = value;
                  print(task);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Due Date'),
              onTap: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    maxTime: DateTime(2100, 1, 1), onChanged: (date) {
                  setState(() {
                    dueDate = Timestamp.fromDate(date);
                  });
                }, onConfirm: (date) {
                  setState(() {
                    dueDate = Timestamp.fromDate(date);
                  });
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
              items: <String>['1 - High', '2 - Medium', '3 - Low']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
//            UsersStream(),
            RaisedButton(
              onPressed: () {
                _firestore.collection('tasks').document().setData({
                  'assigned_to': userId,
                  'completed': false,
                  'created_by': userId,
                  'created': Timestamp.now(),
                  'due_date': dueDate,
                  'task': task,
                  'priority': 1
                });
                print('submitted');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
