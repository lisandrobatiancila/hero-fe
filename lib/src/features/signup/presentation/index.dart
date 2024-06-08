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
  final List<String> _loginOptionList = ["User", "Admin", "Heroe"];
  String? _dropDownValue = "User";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstname = TextEditingController();
    _lastname = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _signupService = SignupService();
    _dropDownValue = _loginOptionList.first;
  }

  void onSaveUser() {
    String fname = _firstname.text;
    String lname = _lastname.text;
    String email = _email.text;
    String password = _password.text;

    SignupDTO signup = SignupDTO(fname, lname, email, password, _dropDownValue);
    _firstname.text = "";
    _lastname.text = "";
    _email.text = "";
    _password.text = "";
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              keyboardType: TextInputType.emailAddress,
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
            const Text(
              "Login as"
            ),
            DropdownButton<String>(
              padding: const EdgeInsets.all(10.0),
              
              value: _dropDownValue,
              items: _loginOptionList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value)
                  );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _dropDownValue = value as String;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
