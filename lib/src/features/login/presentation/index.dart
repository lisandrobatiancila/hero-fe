import 'dart:convert';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroes/src/features/dashboard/presentation/index.dart';
import 'package:heroes/src/features/login/data/loginDTO.dart';
import 'package:heroes/src/features/login/service/login.service.dart';

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
  late TextEditingController _email;
  late TextEditingController _password;
  late LoginService _loginService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    _loginService = LoginService();
  }
  
  void onLoginUser() {
    String email = _email.text;
    String password = _password.text;
    LoginDTO loginDTO = LoginDTO(email, password);


    var resp = _loginService.loginUser(loginDTO);
    var code = 0;
    resp.then((response) => {
      code = response.code,
      if (code == 200) {
        _email.text = "",
        _password.text = "",
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashBoard())
        )
      } else {
        Fluttertoast.showToast(msg: response.message)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.green[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  labelText: "Email"
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  labelText: "Password"
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                onPressed: onLoginUser,
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(200.0, 50.0),
                  backgroundColor: Colors.green[300],
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18.0
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
