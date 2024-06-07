class SignupModel {
  final String message;
  final int code;

  SignupModel({required this.message, required this.code});

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'code': int code,
        'message': String message,
      } => SignupModel(message: message, code: code),
      _ => throw const FormatException("Failed Error Signingup")
    };
  }
}