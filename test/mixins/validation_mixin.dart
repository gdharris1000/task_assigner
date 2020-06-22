import 'package:TaskAssigner/mixins/validation_mixin.dart';
import 'package:flutter_test/flutter_test.dart';

final ValidationMixin validationMixin = ValidationMixin();

void main() {
  test('email validator mixin test', () {
    expect(validationMixin.emailValidator('w'), equals(null));
  });
}
