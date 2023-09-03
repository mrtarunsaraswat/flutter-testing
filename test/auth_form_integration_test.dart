import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart' as test;

void main() {
  test.group('AuthForm Integration Test', () {
    FlutterDriver? driver;

    // Connect to the app before running tests
    test.setUpAll(() async {
      driver = await FlutterDriver.connect(
        dartVmServiceUrl: "ws://127.0.0.1:58557/lTla2qH-HXs=/ws",
        printCommunication: true,
      );
    });

    // Close the connection after tests are done
    test.tearDownAll(() async {
      if (driver != null) {
        driver?.close();
      }
    });

    test.test('Successful authentication', () async {
      // Find email, password, and submit button widgets
      final emailField = find.byValueKey('emailField');
      final passwordField = find.byValueKey('passwordField');
      final submitButton = find.byValueKey('submitButton');

      // Tap email field and enter valid email
      await driver?.tap(emailField);
      await driver?.enterText('test@example.com');

      // Tap password field and enter valid password
      await driver?.tap(passwordField);
      await driver?.enterText('password123');

      // Tap the submit button
      await driver?.tap(submitButton);
    }, timeout: test.Timeout.none);

    test.test('Failed authentication', () async {
      // Find email, password, and submit button widgets
      final emailField = find.byValueKey('emailField');
      final passwordField = find.byValueKey('passwordField');
      final submitButton = find.byValueKey('submitButton');

      // Tap email field and enter valid email
      await driver?.tap(emailField);
      await driver?.enterText('test@example.com');

      // Tap password field and enter invalid password
      await driver?.tap(passwordField);
      await driver?.enterText('123'); // Invalid password

      // Tap the submit button
      await driver?.tap(submitButton);
    }, timeout: test.Timeout.none);
  });
}
