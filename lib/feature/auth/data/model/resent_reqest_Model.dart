class ResentReqestModel {
  final String email;

  ResentReqestModel({required this.email});

  Map<String, dynamic> toJson() {
    return {"email": email};
  }
}