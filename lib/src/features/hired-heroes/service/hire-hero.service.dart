import 'dart:convert';

import 'package:heroes/src/shared/data/hero.domain.dart';
import 'package:heroes/src/shared/domain/shared.domain.dart';
import 'package:heroes/src/shared/ip/shared.constant.dart';
import 'package:http/http.dart' as http;

class HeroServiceDTO {
  late int userId;

  HeroServiceDTO(this.userId);
}

class HireHeroService {
  Future<void> getAllHiredHero(HeroServiceDTO heroServiceDTO) async {

      try{
        var apiResponse = await http.get(
          Uri.parse("http://${SharedConstants.ip}:3000/hire/all-hired-hero/${heroServiceDTO.userId}")
        );

        var response = jsonDecode(apiResponse.body) as Map<String, dynamic>;
        // List<Map<String, dynamic>> heroeList = response['genericDTO'];

        print(apiResponse.body);
        // print("CODE ${response['genericDTO']}");
        if (response['code'] == 200) {
          List<Map<String, dynamic>> heroes = [];

          var heroeList = jsonDecode(response['genericDTO']);
        }
        // return ResponseDomain.fromJson(response, (json) => HiredHeroesDomain.fromJson(json));
      }
      catch(error) {
        print("ERROR >>> ");
        print(error);

        // return ResponseDomain.fromJson({}, (json) => HiredHeroesDomain.fromJson(json));
      }
  }
}