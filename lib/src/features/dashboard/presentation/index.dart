import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:heroes/src/features/dashboard/service/dashboard.service.dart';
import 'package:heroes/src/features/details/presentation/index.dart';
import 'package:heroes/src/features/hire/presentation/index.dart';
import 'package:heroes/src/shared/data/hero.domain.dart';

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
    
    setState(() {
    });
  
  }

  void onHireHero (HeroDomain hero) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => HirePage(hero: hero,))
    );
  }

  void onViewHeroDetials (HeroDomain heroList) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) => HeroDetailPage(heroList: heroList,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text("Total Hired: ${heroList[index].hiredCount}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () {
                        onHireHero(heroList[index]);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[300],
                        textStyle: const TextStyle(fontSize: 18.0),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Hire"),
                    ),
                    const Text(" "),
                    OutlinedButton(
                      onPressed: () {
                        onViewHeroDetials(heroList[index]);
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue[500],
                        textStyle: const TextStyle(fontSize: 18.0),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 5.0, color: Colors.red),
                          borderRadius: BorderRadius.circular(100.0),
                        )
                      ),
                      child: const Text("Details"),
                    )
                  ],
                )
              ],
            ),
          ),
        );
    }),
    );
  }
}
