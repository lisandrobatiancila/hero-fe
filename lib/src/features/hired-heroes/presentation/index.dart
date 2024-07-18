import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  int _indexHeroToRemove = 0;

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

  void onConfirmRemoveHero (int heroId, int userId, int index) async {
    var response = await _heroServiceDTO.removeHiredHeroe(heroId, userId);

    Fluttertoast.showToast(msg: response.message);
    Navigator.pop(context);
    heroeList.removeAt(index);
    setState(() {
      
    });
  }

  void onRemoveHiredHero (HiredHeroesDomain? hero) {
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(
              top: 20.0
            ),
            child: Column(              
              children: <Widget>[
                const Text("Are you sure you want to remove"),
                Text(
                  StringManipulation().upperCaseFirstCharacter(hero!.name),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 50.0
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonComponent().CustomButton(() {
                        Navigator.pop(context);
                      },
                        const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ), 
                        OutlinedButton.styleFrom(
                          backgroundColor: Colors.red[300]
                        )
                      ),
                      const SizedBox(width: 10,),
                      ButtonComponent().CustomButton(() {
                        onConfirmRemoveHero(hero!.heroId, _accountProvider!.accountInfo!.userId, _indexHeroToRemove );
                      }, 
                        const Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ), 
                        OutlinedButton.styleFrom(
                          backgroundColor: Colors.green[300]
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ),
      );
    },
      isDismissible: false
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Hired Heroes"),
        backgroundColor: Colors.green[300],
      ),
      body: Container(
        child: heroeList.isEmpty ? const Text("No records..") 
        :
        ListView.builder(
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
                      () {
                        _indexHeroToRemove = index;
                        onRemoveHiredHero(heroeList[index]);
                      }, 
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
                      () {}, 
                      const Text("Information"),
                      null
                    )
                  ],
                )
              ],
            ),
          );
      }),
      )
    );
  }
}