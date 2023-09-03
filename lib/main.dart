import 'package:auth_example/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthForm(),
    );
  }
}

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    AuthLogic authLogic = AuthLogic();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing example"),
      ),
      body: Form(
        key: authLogic.formKey,
        child: Column(
          children: [
            TextFormField(
              key: const Key('emailField'),
              controller: authLogic.emailController,
              validator: authLogic.emailValidator,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              key: const Key('passwordField'),
              controller: authLogic.passwordController,
              validator: authLogic.passwordValidator,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              key: const Key('submitButton'),
              onPressed: authLogic.submitForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
