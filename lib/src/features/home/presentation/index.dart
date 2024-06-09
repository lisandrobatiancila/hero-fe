import 'package:flutter/material.dart';
import 'package:heroes/src/features/login/presentation/index.dart';
import 'package:heroes/src/features/signup/presentation/index.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  _Home createState () => _Home();
}


class _Home extends State<Home> {

  void onLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage()
      )
    );
  }

  void onSingup() {
    Navigator.push(context, 
    MaterialPageRoute(
      builder: (context) =>  SingupPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.green[300],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Welcome to the Heroes App",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              height: 200,
            ),
            FilledButton(
                onPressed: onLogin, 
                style: FilledButton.styleFrom(
                backgroundColor: Colors.green[200],
                minimumSize: const Size(200.0, 50.0)
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 18.0
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            FilledButton(
                onPressed: onSingup, 
                style: FilledButton.styleFrom(
                backgroundColor: Colors.green[200],
                minimumSize: const Size(200.0, 50.0)
              ), 
                child: const Text(
                  "Signup",
                  style: TextStyle(
                    fontSize: 18.0
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
