import 'package:heroes/src/features/shared/ip/shared.constant.dart';
import 'package:http/http.dart' as http;

class SharedService {
  Future<http.Response> getAllHeroes() {
    SharedConstants _sharedConstants = SharedConstants();

    http.get(
      Uri.parse("http://${_sharedConstants.getIp()}:3000")
    );
  }
}