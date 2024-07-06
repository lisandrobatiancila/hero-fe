import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heroes/src/features/hire/domain/hire.test.dart';
import 'package:heroes/src/features/shared/data/hero.domain.dart';

class HirePage extends StatefulWidget{
  HirePage({required this.hero});
  HeroDomain hero;

  @override
  _HirePage createState () => _HirePage();
}

class _HirePage extends State<HirePage> {
  late HeroDomain hero;
  List<HireTestData> records = [
    HireTestData(quantity: 10, name: "Tests"),
    HireTestData(quantity: 11, name: "Tests1"),
    HireTestData(quantity: 12, name: "Tests2"),
  ];
  
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
                    color: Colors.grey, 
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
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Firstname"
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Lastname"
                      ),
                    ),
                    textFormFieldCustom("Tests", decoration: InputDecoration(labelText: "tests")),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[300],
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: const Text(
                            "Save",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: records.length, 
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Text(records[index].name),
                    Text('Quanity ${records[index].quantity}'),
                    ElevatedButton(onPressed: () {
                      records[index].quantity += 1;
                      setState(() {
                        
                      });
                    }, 
                    child: Icon(Icons.add))
                  ],
                );
            })
          ],
        ),
      ),
    );
  }

  Widget textFormFieldCustom (String hint, {InputDecoration? decoration}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: hint
      )
    );
  }

  Widget customContainer () {
    return Image.asset("images/one.jpeg");
  }
}