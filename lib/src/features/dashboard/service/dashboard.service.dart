import 'dart:convert';

import 'package:heroes/src/features/shared/data/hero.data.dart';
import 'package:heroes/src/features/shared/data/hero.domain.dart';
import 'package:heroes/src/features/shared/ip/shared.constant.dart';
import 'package:http/http.dart' as http;

class DashBoardService {
  Future<HeroDomain> getAllHeroes() async {
    SharedConstants _sharedConstants = SharedConstants();
    var response = await http.get(
      Uri.parse("http://${_sharedConstants.getIp()}:3000/dashboard"),
    );

    var decode = jsonDecode(response.body);
    
    return HeroDomain.fromJson(decode);
  }
}