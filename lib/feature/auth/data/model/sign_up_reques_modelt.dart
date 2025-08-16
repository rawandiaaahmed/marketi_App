class SignUpRequestModel {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpRequestModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    };
  }
}