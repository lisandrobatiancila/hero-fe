import 'package:flutter/material.dart';
import 'package:heroes/src/features/shared/data/hero.domain.dart';
import 'package:heroes/src/utility/string.dart';

// class HeroDetailPage extends StatelessWidget {
//   HeroDomain heroList;
//   HeroDetailPage({required this.heroList});
//   @override
//   Widget build(BuildContext context) {
//     return HeroDetail(heroList: heroList);
//   }
// }

class HeroDetailPage extends StatefulWidget {
  HeroDetailPage({required this.heroList});
  HeroDomain heroList;
  
  @override
  _HeroDetail createState () => _HeroDetail();
}

class _HeroDetail extends State<HeroDetailPage> {
  StringManipulation stringManipulation = StringManipulation();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Hero Details"),
        backgroundColor: Colors.green[300],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text("Hero: ${stringManipulation.upperCaseFirstCharacter(widget.heroList.name)}")
          ],
        ),
      ),
    );
  }
}
