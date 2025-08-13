
class ResentModel {
  final String message;

  ResentModel({required this.message});
  factory ResentModel.fromJson(Map<String, dynamic> jsonData) {
    return ResentModel(message: jsonData['message'] ?? '');
  }
}