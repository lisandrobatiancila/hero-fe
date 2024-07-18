import 'dart:convert';

import 'package:heroes/src/shared/data/hero.domain.dart';
import 'package:heroes/src/shared/domain/shared.domain.dart';
import 'package:heroes/src/shared/ip/shared.constant.dart';
import 'package:heroes/src/utility/string.dart';
import 'package:http/http.dart' as http;

class HeroServiceDTO {
  late int userId;

  HeroServiceDTO(this.userId);
}

class HireHeroService {
  StringManipulation _stringManipulation = StringManipulation();

  Future<List<HiredHeroesDomain>> getAllHiredHero(HeroServiceDTO heroServiceDTO) async {

      try{
        var apiResponse = await http.get(
          Uri.parse("http://${SharedConstants.ip}:3000/hire/all-hired-hero/${heroServiceDTO.userId}")
        );

        var response = jsonDecode(apiResponse.body) as Map<String, dynamic>;

        List<HiredHeroesDomain> heroeList = [];
        if (response['code'] == 200) {
          for(var hl in response['genericDTO']) {
            heroeList.add(HiredHeroesDomain.fromJson(hl));
          }
        }

        return heroeList;
      }
      catch(error) {
        print("ERROR >>> filename: hire-hero.service.dart");
        print(error);
        return [];
      }
  }

  Future<ResponseDomain> removeHiredHeroe(int heroId, int userId) async{
    try{
      print("HERO >> $heroId");
      var apiResponse = await http.post(
        Uri.parse("http://${SharedConstants.ip}:3000/hire/remove-hero"),
        body: <String, String> {
          "heroId": _stringManipulation.parseNumberToString(heroId),
          "userId": _stringManipulation.parseNumberToString(userId),
        }
      );

      var response = jsonDecode(apiResponse.body) as Map<String, dynamic>;
      return ResponseDomain.fromJson(response, (json) => json);
    }
    catch(error) {
      print('ERROR >> hired-heroes/service/hire-hero.service.dart');
      print(error);
      return ResponseDomain.fromJson({}, (json) => null);
    }
  }
}