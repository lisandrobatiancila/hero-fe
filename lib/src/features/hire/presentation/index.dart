import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroes/src/features/hire/data/hireDTO.dart';
import 'package:heroes/src/features/hire/domain/hire.domain.dart';
import 'package:heroes/src/features/hire/service/hire.service.dart';
import 'package:heroes/src/shared/data/hero.domain.dart';
import 'package:heroes/src/shared/provider/account.provider.dart';
import 'package:provider/provider.dart';

class HirePage extends StatefulWidget{
  HirePage({required this.hero});
  HeroDomain hero;

  @override
  _HirePage createState () => _HirePage();
}

class _HirePage extends State<HirePage> {
  late HeroDomain hero;
  final HireHeroService _hireHeroService = HireHeroService();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // List<HireTestData> records = [
  //   HireTestData(quantity: 10, name: "Tests"),
  //   HireTestData(quantity: 11, name: "Tests1"),
  //   HireTestData(quantity: 12, name: "Tests2"),
  // ];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hero = widget.hero;
  }

  void onSaveHiredHero () {
    if (_formKey.currentState!.validate()) {
      HireHeroDTO hireHero = HireHeroDTO(hero.id, _firstNameController.text, _lastNameController.text);
      var response = _hireHeroService.hireHero(hireHero);

      response.then((value) {
        var code = value?.code;
        var message = value?.message ?? "";
        if (code == 200) {
          Fluttertoast.showToast(msg: message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hire"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green[300],
      ),
      body: Consumer<AccountProvider>(
        builder: (context, account, child) {
          return Container(
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
                    boxShadow: const [
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
                          child: Text("Hero information ${account.getEmail()}"),
                        ),
                      ),
                      Text("Name: ${hero.name}"),
                      Text("Description: ${hero.description}"),
                      Text("Total Hired: ${hero.hiredCount}")
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _firstNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter firstname";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Firstname"
                          ),
                        ),
                        TextFormField(
                          controller: _lastNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter lastname";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Lastname"
                          ),
                        ),
                        // textFormFieldCustom("Tests", decoration: InputDecoration(labelText: "tests")),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: ElevatedButton(
                            onPressed: onSaveHiredHero,
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
                // ListView.builder(
                //   shrinkWrap: true,
                //   // physics: const NeverScrollableScrollPhysics(),
                //   itemCount: records.length, 
                //   itemBuilder: (context, index) {
                //     return Column(
                //       children: <Widget>[
                //         Text(records[index].name),
                //         Text('Quanity ${records[index].quantity}'),
                //         ElevatedButton(onPressed: () {
                //           records[index].quantity += 1;
                //           setState(() {
                            
                //           });
                //         }, 
                //         child: Icon(Icons.add))
                //       ],
                //     );
                // })
              ],
            ),
          );
        },
      ),
    );
  }

  // Widget textFormFieldCustom (String hint, {InputDecoration? decoration}) {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: hint
  //     )
  //   );
  // }

  // Widget customContainer () {
  //   return Image.asset("images/one.jpeg");
  // }
}