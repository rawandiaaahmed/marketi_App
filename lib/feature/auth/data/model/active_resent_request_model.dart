class ActiveResentRequestModel {
  final String email;
  final String code;

  ActiveResentRequestModel({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "code": code,
    };
  }
}