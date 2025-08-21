class ProfileModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String address;
  final String image;

  ProfileModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.image,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    
    final data = json['message'] ?? json;

    return ProfileModel(
      id: data['_id']?.toString() ?? '',
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      email: data['email'] ?? '',
      address: data['address'] ?? '',
      image: data['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": {
        "_id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "address": address,
        "image": image,
      }
    };
  }
}