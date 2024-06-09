class SignupDTO {
  String firstName;
  String lastName;
  String email;
  String password;
  String? registerType;

  SignupDTO(this.firstName, this.lastName, this.email, this.password, this.registerType);
}

class SignupResponseDTO {
  String message;
  int code;
  SignupResponseDTO (this.message, this.code);
}