class ResponseDomain<T> {
  final int code;
  final String message;
  final T genericClass;

  ResponseDomain({required this.code, required this.message, required this.genericClass});

  factory ResponseDomain.fromJson (Map<String, dynamic> json) => ResponseDomain(
    code: json['code'], 
    message: json['message'],
    genericClass: json['info'],
  );
}
