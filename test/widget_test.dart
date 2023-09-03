import 'package:auth_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AuthForm UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AuthForm()));

    expect(find.text('Testing example'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
    final emailField = find.byKey(const Key('emailField'));
    await tester.enterText(emailField, 'test@example.com');
    final passwordField = find.byKey(const Key('passwordField'));
    await tester.enterText(passwordField, 'password123');
    final submitButton = find.byKey(const Key('submitButton'));
    await tester.tap(submitButton);
    await tester.pump();
  });
}
