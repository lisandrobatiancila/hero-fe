import 'dart:convert';

import 'package:heroes/src/features/shared/data/hero.data.dart';
import 'package:heroes/src/features/shared/data/hero.domain.dart';
import 'package:heroes/src/features/shared/ip/shared.constant.dart';
import 'package:http/http.dart' as http;

class DashBoardService {
  Future<List<HeroDomain>> getAllHeroes() async {
    var response = await http.get(
      Uri.parse("http://${SharedConstants.ip}:3000/dashboard"),
    );

    var decode = jsonDecode(response.body) as List<dynamic>;
    List<HeroDomain> record = [];
    for(var d in decode) {
      record.add(HeroDomain.fromJson(d));
    }
    return record;
  }
}
