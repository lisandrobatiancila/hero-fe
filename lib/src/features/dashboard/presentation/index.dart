import 'package:flutter/material.dart';
import 'package:heroes/src/features/dashboard/service/dashboard.service.dart';

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
  late DashBoardService _dashBoardService;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dashBoardService = DashBoardService();
  }

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
      body: Column(
        children: <Widget>[
          const Text("Sample1"),
          const Text("Sample2"),
          const Text("Sample3"),
          FilledButton(
            onPressed: () {
              var records = _dashBoardService.getAllHeroes();
            },
            child: Text("Get heroes"),
          )
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