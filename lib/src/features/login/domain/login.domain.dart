class LoginModel {
  String message;
  int code;

  LoginModel({required this.message, required this.code});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'message': String message,
        'code': int code,
      } => LoginModel(message: message, code: code),
      _ => throw const FormatException("Failed Error Login")
    };
  }
}