import 'package:flutter/material.dart';

class AuthLogic {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      // Perform authentication logic
      if (email == 'test@example.com' && password == 'password123') {
        // If credentials are valid, you can trigger a success action here
        // For now, let's print a success message
        print('Authentication successful');
      } else {
        // If credentials are invalid, you can trigger a failure action here
        // For now, let's print an error message
        print('Authentication failed');
      }
    }
  }
}
