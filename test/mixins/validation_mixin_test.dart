import 'package:TaskAssigner/mixins/validation_mixin.dart';
import 'package:flutter_test/flutter_test.dart';

final ValidationMixin validationMixin = ValidationMixin();

void main() {
  test('email validator mixin test', () {
    expect(
        validationMixin.emailValidator('w'), equals('Invalid e-mail address'));
    expect(validationMixin.emailValidator('bob@bob.com'), equals(null));
  });

  test('password validator mixin test', () {
    expect(validationMixin.passwordValidator('1'),
        equals('Password is too short'));
  });
}
