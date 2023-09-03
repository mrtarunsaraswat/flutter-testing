// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:auth_example/logic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthForm Unit Tests', () {
    test('Valid email', () {
      final validator = AuthLogic().emailValidator;
      expect(validator('test@example.com'), null);
    });

    test('Invalid email', () {
      final validator = AuthLogic().emailValidator;
      expect(validator(''), 'Invalid email');
    });

    test('Valid password', () {
      final validator = AuthLogic().passwordValidator;
      expect(validator('password123'), null);
    });

    test('Invalid password', () {
      final validator = AuthLogic().passwordValidator;
      expect(validator('123'), 'Password must be at least 6 characters');
    });
  });
}
