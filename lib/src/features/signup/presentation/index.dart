import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroes/src/features/signup/data/signup.data.dart';
import 'package:heroes/src/features/signup/service/signup.service.dart';

class SingupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Signup();
  }
}

class Signup extends StatefulWidget {
  @override
  _Signup createState () => _Signup();
}

class _Signup extends State<Signup> {
  late TextEditingController _firstname;
  late TextEditingController _lastname;
  late TextEditingController _email;
  late TextEditingController _password;
  late SignupService _signupService;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstname = TextEditingController();
    _lastname = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _signupService = SignupService();
  }

  void onSaveUser() {
    String fname = _firstname.text;
    String lname = _lastname.text;
    String email = _email.text;
    String password = _password.text;

    SignupDTO signup = SignupDTO(fname, lname, email, password);
    _signupService.signupUser(signup);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
        backgroundColor: Colors.green[300],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _firstname,
              decoration: const InputDecoration(
                labelText: "Firstname"
              ),
            ),
            TextFormField(
              controller: _lastname,
              decoration: const InputDecoration(
                labelText: "Lastname"
              ),
            ),
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                labelText: "Email"
              ),
            ),
            TextFormField(
              controller: _password,
              decoration: const InputDecoration(
                labelText: "Password"
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 20.0,
            ),
            FilledButton(
              onPressed: onSaveUser,
              style: FilledButton.styleFrom(
                minimumSize: const Size(200.0, 50.0),
                backgroundColor: Colors.green[300],
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 18.0
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
