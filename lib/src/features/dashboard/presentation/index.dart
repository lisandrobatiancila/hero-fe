import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashBoard(),
    );
  }
}

class DashBoard extends StatefulWidget {
  @override
  _DashBaord createState () => _DashBaord();
}

class _DashBaord extends State<DashBoard> {
  @override
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
    canPop: false,
      child: Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green[300],
      ),
      body: const Column(
        children: <Widget>[
          Text("Sample1"),
          Text("Sample2"),
        ],
      ),
    ),
    onPopInvoked: (context) => {
      print("Tests"),
      print(context)
    },
    );
  }
}