import 'package:DoMyBidding/screens/register.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {};

void main(){
  test('registration', (WidgetTester tester) async {
    final AuthMock mock = AuthMock();
    await tester.pumpWidget(MaterialApp(home: RegisterScreen(auth: mock),));
  });
}