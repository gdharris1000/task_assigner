import 'package:firebase_auth/firebase_auth.dart';

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
}
