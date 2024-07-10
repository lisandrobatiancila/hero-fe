class LoginModel {
  int userId;
  String email;
  String password;

  LoginModel(this.userId, this.email, this.password);

  // factory LoginModel.fromJson(Map<String, dynamic> json) {
  //   return switch(json) {
  //     {
  //       'message': String message,
  //       'code': int code,
  //       'genericDTO': T genericDTO,
        
  //     } => LoginModel(),
  //     _ => throw const FormatException("Failed Error Login")
  //   };
  // }
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    json['userId'],
    json['email'],
    json['password']
  );
}