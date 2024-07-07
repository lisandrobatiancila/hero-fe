class ResponseDomain {
  final int code;
  final String message;

  ResponseDomain({required this.code, required this.message});

  factory ResponseDomain.fromJson (Map<String, dynamic> json) => ResponseDomain(
    code: json['code'], 
    message: json['message'],
  );
}
