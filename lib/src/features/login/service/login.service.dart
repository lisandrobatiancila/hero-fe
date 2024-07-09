import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroes/src/features/login/data/loginDTO.dart';
import 'package:heroes/src/features/login/domain/login.domain.dart';
import 'package:heroes/src/shared/ip/shared.constant.dart';
import 'package:heroes/src/utility/string.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<LoginModel> loginUser(LoginDTO loginDTO) async {
    try{
      var response = await http.post(
        Uri.parse("http://${SharedConstants.ip}:3000/login"),
        body: <String, String> {
          'email': loginDTO.email,
          'password': loginDTO.password,
        }
      );

      var decode = jsonDecode(response.body) as Map<String, dynamic>;
      
      return LoginModel.fromJson(decode);
    }
    catch(error) {
      print("ERROR HERE ---- ");
      if (error is SocketException) {
        Fluttertoast.showToast(msg: "No network detected");
      }
      return LoginModel.fromJson(jsonDecode("{}"));
    }
  }
}
