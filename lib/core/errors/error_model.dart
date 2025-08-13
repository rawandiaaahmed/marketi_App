import 'package:flutter_application_1/core/network/end_ponits.dart';

class ErrorModel {
  final String message;

  ErrorModel({required this.message});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(message: jsonData[ApiKey.message] ?? 'Unknown error');
  }
}
