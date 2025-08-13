
class ActiveResentModel {
  final String message;

  ActiveResentModel({required this.message});
  factory ActiveResentModel.fromJson(Map<String, dynamic> jsonData) {
    return ActiveResentModel(message: jsonData['message'] ?? '');
  }
}