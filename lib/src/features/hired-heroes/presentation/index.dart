import 'package:flutter/material.dart';
import 'package:heroes/src/features/hired-heroes/service/hire-hero.service.dart';
import 'package:heroes/src/shared/data/hero.domain.dart';
import 'package:heroes/src/shared/presentation/button.dart';
import 'package:heroes/src/shared/provider/account.provider.dart';
import 'package:heroes/src/utility/string.dart';
import 'package:provider/provider.dart';

class HiredHeroesPage extends StatefulWidget {

  @override
  _HiredHeroesPage createState () => _HiredHeroesPage();
}

class _HiredHeroesPage extends State<HiredHeroesPage> {
  final HireHeroService _heroServiceDTO = HireHeroService();
  late AccountProvider _accountProvider = Provider.of(context, listen: false);
  List<HiredHeroesDomain> heroeList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHeroeList();
  }

  void getHeroeList () async {
    var response =_heroServiceDTO.getAllHiredHero(HeroServiceDTO(_accountProvider.accountInfo.userId));
    heroeList = await response;
    setState(() {
      
    });
  }

  void onRemoveHiredHero () {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Hired Heroes"),
        backgroundColor: Colors.green[300],
      ),
      body: ListView.builder(
        itemCount: heroeList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(
              left: 3.0,
              right: 3.0,
              top: 3.0
            ),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5.0))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Name: ${StringManipulation().upperCaseFirstCharacter(heroeList[index].name)}",
                ),
                Text("This hero was hired ${heroeList[index].hiredCount} time(s)"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonComponent().CustomButton(
                      onRemoveHiredHero, 
                      const Text(
                        "Remove",
                        style: TextStyle(color: Colors.white)
                      ),
                      ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[300],
                      )
                    ),
                    const SizedBox(width: 10.0,),
                    ButtonComponent().CustomButton(
                      onRemoveHiredHero, 
                      const Text("Information"),
                      null
                    )
                  ],
                )
              ],
            ),
          );
      }),
    );
  }
}