class LoginModel {
  String message;
  String email;
  String password;
  int code;

  LoginModel({required this.message, required this.code, required this.email, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'message': String message,
        'email': String email,
        'password': String password,
        'code': int code,
        
      } => LoginModel(message: message, email: email, password: password, code: code),
      _ => throw const FormatException("Failed Error Login")
    };
  }
}