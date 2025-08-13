
class NewPasswordModel {
  final String message;

  NewPasswordModel({required this.message});
  factory NewPasswordModel.fromJson(Map<String, dynamic> jsonData) {
    return NewPasswordModel(message: jsonData['message'] ?? '');
  }
}