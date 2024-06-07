import 'dart:convert';

import 'package:heroes/src/features/signup/data/signup.data.dart';
import 'package:heroes/src/features/signup/domain/signup.domain.dart';
import 'package:http/http.dart' as http;

class SignupService {
  Future<http.Response> signupUser(SignupDTO signupModel) async {
    return await http.post(
      Uri.parse("http://10.10.8.131:3000/signup"),
      body: <String, String> {
        'firstname': signupModel.firstName,
        'lastname': signupModel.lastName,
        'email': signupModel.email,
        'password': signupModel.password,
      }
    );
  }
}
