import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroes/src/features/shared/ip/shared.constant.dart';
import 'package:heroes/src/features/signup/data/signup.data.dart';
import 'package:heroes/src/features/signup/domain/signup.domain.dart';
import 'package:http/http.dart' as http;

class SignupService {
  Future<SignupModel> signupUser(SignupDTO signupModel) async {
    SharedConstants _sharedConstants = SharedConstants();
    var response = await http.post(
      Uri.parse("http://${_sharedConstants.getIp()}:3000/signup"),
      body: <String, String ?> {
        'firstname': signupModel.firstName,
        'lastname': signupModel.lastName,
        'email': signupModel.email,
        'password': signupModel.password,
        'registerType': signupModel.registerType,
      }
    );
    var decode = jsonDecode(response.body) as Map<String, dynamic>;
    var message = decode.entries.elementAt(0).value;
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);

    return SignupModel.fromJson(decode);
  }
}
