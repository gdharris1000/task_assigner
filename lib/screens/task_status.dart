import 'package:flutter/material.dart';
import 'package:DoMyBidding/streams/task_stream.dart';
import 'new_task.dart';
import 'package:DoMyBidding/models/filters.dart';
import 'package:DoMyBidding/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:DoMyBidding/screens/welcome.dart';

class TaskStatusScreen extends StatefulWidget {
  static const String id = 'taskStatus';
  @override
  _TaskStatusScreenState createState() => _TaskStatusScreenState();
}

class _TaskStatusScreenState extends State<TaskStatusScreen> {
  final GetUserInfo getUserInfo = GetUserInfo();
  String currentUser = "";

  void getCurrentUser() {
    getUserInfo.getCurrentUser().then((FirebaseUser result) {
      setState(() {
        currentUser = result.uid;
        print(currentUser);
      });
    });
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks you created'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              GetUserInfo().logOut();
              Navigator.pop(context);
              Navigator.pushNamed(context, WelcomeScreen.id);
            },
            child: FaIcon(
              FontAwesomeIcons.signOutAlt,
              color: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewTaskScreen())),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child: TaskStream(currentUser, Filter.assignedByUser)),
          ],
        ),
      ),
    );
  }
}
