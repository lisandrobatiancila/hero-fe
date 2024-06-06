import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstname = TextEditingController();
    _lastname = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  void onSaveUser() {
    print("Name: ${_firstname.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
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
