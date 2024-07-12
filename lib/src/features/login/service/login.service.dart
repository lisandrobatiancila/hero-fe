import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroes/src/features/login/data/loginDTO.dart';
import 'package:heroes/src/features/login/domain/login.domain.dart';
import 'package:heroes/src/shared/domain/shared.domain.dart';
import 'package:heroes/src/shared/ip/shared.constant.dart';
import 'package:heroes/src/utility/string.dart';
import 'package:http/http.dart' as http;

class Tests {
  String email;
  String password;

  Tests({required this.email, required this.password});
}
class LoginService {
  Future<ResponseDomain<LoginModel>> loginUser(LoginDTO loginDTO) async {
    try{
      var response = await http.post(
        Uri.parse("http://${SharedConstants.ip}:3000/login"),
        body: <String, String> {
          'email': loginDTO.email,
          'password': loginDTO.password,
        }
      );

      var decode = jsonDecode(response.body) as Map<String, dynamic>;
      
      return ResponseDomain.fromJson(decode, (json) => LoginModel.fromJson(json));
    }
    catch(error) {
      print("ERROR HERE ---- ");
      if (error is SocketException) {
        Fluttertoast.showToast(msg: "No network detected");
      }
       return ResponseDomain.fromJson(<String, dynamic> {'email': '', 'password': ''}, 
         (json) => LoginModel.fromJson(json)
      );
    }
  }
}
