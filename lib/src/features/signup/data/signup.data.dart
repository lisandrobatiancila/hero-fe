class SignupDTO {
  String firstName;
  String lastName;
  String email;
  String password;
  String? registerType;

  SignupDTO(this.firstName, this.lastName, this.email, this.password, this.registerType);
}
