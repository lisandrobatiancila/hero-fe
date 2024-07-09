import 'dart:convert';

import 'package:heroes/src/shared/domain/shared.domain.dart';
import 'package:heroes/src/shared/ip/shared.constant.dart';
import 'package:http/http.dart' as http;

class HeroServiceDTO {
  late int userId;

  HeroServiceDTO(this.userId);
}

class HireHeroService {
  Future<ResponseDomain> getAllHiredHero(HeroServiceDTO heroServiceDTO) async {

      var apiResponse = await http.get(
        Uri.parse("http://${SharedConstants.ip}:3000/hire/all-hired-hero/${heroServiceDTO.userId}")
      );

      var response = jsonDecode(apiResponse.body) as Map<String, dynamic>;

    return ResponseDomain.fromJson(response);
  }
}