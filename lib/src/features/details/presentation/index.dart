import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heroes/src/shared/data/hero.domain.dart';
import 'package:heroes/src/utility/hero.description.dart';
import 'package:heroes/src/utility/string.dart';
import 'package:bulleted_list/bulleted_list.dart';

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
  HeroDescription _description = HeroDescription();
  String _heroDescription = "";
  late List<dynamic> encodedDescription = [];
  bool _hasFound = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    for(var hd in _description.heroDescription) {
      if (hd.entries.elementAt(1).value == stringManipulation.upperCaseFirstCharacter(widget.heroList.name)) {
        _heroDescription = hd.entries.elementAt(2).value;
        
        if (_heroDescription.length > 0) {
          _hasFound = true;
        }
        break;
      }
    }

    if(_hasFound) {
      String descriptionTemp = _heroDescription.replaceAll("'", '"');
      encodedDescription = jsonDecode(descriptionTemp);
    }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Hero: ${stringManipulation.upperCaseFirstCharacter(widget.heroList.name)}"),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text("Description")
                ),
            ),
            Expanded(
              child: BulletedList(
                    listItems: encodedDescription,
                    bulletType: BulletType.numbered,
              )
            )
          ],
        ),
      ),
    );
  }
}
