import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class GetUserInfo {
  final _auth = FirebaseAuth.instance;

  Future<FirebaseUser> getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        return user;
      }
    } catch (e) {
      print(e);
      print('no user data');
    }
  }

  Future<List<List>> getUserNames() async {
    try {
      final QuerySnapshot users =
          await _firestore.collection('users').getDocuments();
      List<List> userNames = [];

      for (var user in users.documents) {
        userNames.add([user['name'], user['uid']]);
      }
      print(userNames);
      return userNames;
    } catch (e) {
      print(e);
    }
  }

  Future<String> getUserID(String name) async {
    try {
      final user = await _firestore
          .collection('users')
          .where('name', isEqualTo: name)
          .getDocuments();
      String userID = user.documents[0]['uid'];
      print(userID);
      return userID;
    } catch (e) {
      print(e);
    }
  }

  Future<String> getUserName(String uid) async {
    try {
      final user = await _firestore
          .collection('users')
          .where('uid', isEqualTo: uid)
          .getDocuments();
      String userID = user.documents[0]['name'];
      print(userID);
      return userID;
    } catch (e) {
      print(e);
    }
  }
}
