import 'package:flutter/material.dart';
import 'package:heroes/src/features/shared/data/hero.domain.dart';

class HirePage extends StatefulWidget{
  HirePage({required this.hero});
  HeroDomain hero;

  @override
  _HirePage createState () => _HirePage();
}

class _HirePage extends State<HirePage> {
  late HeroDomain hero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hero = widget.hero;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hire"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green[300],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Colors.red, 
                    offset: Offset(1, 5),
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    shape: const RoundedRectangleBorder(),                    
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const Text("Hero information"),
                    ),
                  ),
                  Text("Name: ${hero.name}"),
                  Text("Description: ${hero.description}")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}