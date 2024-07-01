import 'package:flutter/material.dart';
import 'package:heroes/src/features/dashboard/service/dashboard.service.dart';
import 'package:heroes/src/features/shared/data/hero.domain.dart';

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
  late List<HeroDomain> heroList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dashBoardService = DashBoardService();
    heroList = [];

    getAllHeroList();
  }

  void getAllHeroList() async{
    heroList = await _dashBoardService.getAllHeroes();
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
      body: ListView.builder(itemCount: heroList.length, itemBuilder: (context, index) {
        return Card(
            elevation: 3.0,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Name: ${heroList[index].name}"),
                  Text("Power: ${heroList[index].power}"),
                  Text("Desc.: ${heroList[index].description}"),
                ],
              ),
            ),
          );
      }),
    ),
    onPopInvoked: (context) => {
      print("Tests"),
      print(context)
    },
    );
  }
}