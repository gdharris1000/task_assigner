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

  Future<List<String>> getUserNames() async {
    try {
      final QuerySnapshot users =
          await _firestore.collection('users').getDocuments();
      List<String> userNames = [];

      for (var user in users.documents) {
        userNames.add(user['name']);
      }
      print(userNames);
      return userNames;
    } catch (e) {
      print(e);
    }
  }
}
