import 'dart:convert';

import 'package:heroes/src/features/hire/data/hireDTO.dart';
import 'package:heroes/src/features/login/domain/login.domain.dart';
import 'package:heroes/src/shared/domain/shared.domain.dart';
import 'package:heroes/src/shared/ip/shared.constant.dart';
import 'package:heroes/src/utility/string.dart';
import 'package:http/http.dart' as http;

class HireHeroService {
  Future<ResponseDomain> hireHero(HireHeroDTO hireHero) async {
    try{
      StringManipulation _stringManipulation = StringManipulation();
      var apiResponse = await http.post(
        Uri.parse("http://${SharedConstants.ip}:3000/hire"),
        body: <String, dynamic> {
          'heroID': _stringManipulation.parseNumberToString(hireHero.heroID),
          'userId': _stringManipulation.parseNumberToString(hireHero.userId),
          'firstName': hireHero.firstName,
          'lastName': hireHero.lastName
        }
      );
      var response = jsonDecode(apiResponse.body) as Map<String, dynamic>;
      
      return ResponseDomain.fromJson(response, null);
    }
    catch(error) {
      print("Error > presentation/hire.service.dart");
      print(error);
      return ResponseDomain.fromJson(<String, dynamic> {'': '', '': ''}, null);
    }

  }
}