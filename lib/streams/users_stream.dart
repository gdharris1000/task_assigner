import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class UsersStream extends StatelessWidget {
  String selectedUser = "";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('users').snapshots(),
      builder: (context, snapshot) {
        List<String> userList = [];
        final users = snapshot.data.documents;
        for (var userData in users) {
          userList.add(userData.data['name']);
        }
        return DropdownButton<String>(
          value: userList[0],
          icon: Icon(Icons.arrow_drop_down),
          items: userList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (value) {
            selectedUser = value;
          },
        );
      },
    );
  }
}
