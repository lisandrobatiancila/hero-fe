import 'package:flutter/material.dart';
import 'package:heroes/src/features/hired-heroes/service/hire-hero.service.dart';
import 'package:heroes/src/shared/provider/account.provider.dart';
import 'package:provider/provider.dart';

class HiredHeroesPage extends StatefulWidget {

  @override
  _HiredHeroesPage createState () => _HiredHeroesPage();
}

class _HiredHeroesPage extends State<HiredHeroesPage> {
  final HireHeroService _heroServiceDTO = HireHeroService();
  late AccountProvider _accountProvider = Provider.of(context, listen: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var response =_heroServiceDTO.getAllHiredHero(HeroServiceDTO(_accountProvider.accountInfo.userId));

    response.then((value) {
      print("VALUE");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Hired Heroes"),
        backgroundColor: Colors.green[300],
      ),
      body: null,
    );
  }
}