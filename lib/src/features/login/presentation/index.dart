import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Login();
  }
}

class Login extends StatefulWidget {

  @override
  _Login createState () => _Login();
}

class _Login extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.green[300],
      ),
    );
  }
}
