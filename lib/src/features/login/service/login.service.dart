import 'dart:convert';

import 'package:heroes/src/features/login/data/loginDTO.dart';
import 'package:heroes/src/features/login/domain/login.domain.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<LoginModel> loginUser(LoginDTO loginDTO) async {
    var response = await http.post(
      Uri.parse("http://10.10.8.131:3000/login"),
      body: <String, String> {
        'email': loginDTO.email,
        'password': loginDTO.password,
      }
    );

    var decode = jsonDecode(response.body) as Map<String, dynamic>;
    
    return LoginModel.fromJson(decode);
  }
}
