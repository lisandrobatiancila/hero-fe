import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroes/src/features/login/data/loginDTO.dart';
import 'package:heroes/src/features/login/domain/login.domain.dart';
import 'package:heroes/src/features/shared/ip/shared.constant.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<LoginModel> loginUser(LoginDTO loginDTO) async {
    try{
      SharedConstants _sharedConstants = SharedConstants();
      var response = await http.post(
        Uri.parse("http://${_sharedConstants.getIp()}:3000/login"),
        body: <String, String> {
          'email': loginDTO.email,
          'password': loginDTO.password,
        }
      );

      var decode = jsonDecode(response.body) as Map<String, dynamic>;
      
      return LoginModel.fromJson(decode);
    }
    catch(error) {
      if (error is SocketException) {
        Fluttertoast.showToast(msg: "No network detected");
      }
      return LoginModel.fromJson(jsonDecode("{}"));
    }
  }
}
