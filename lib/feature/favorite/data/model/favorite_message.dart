class FavoriteMessage {
  final String message;
FavoriteMessage({required this.message});

  factory FavoriteMessage.fromJson(Map<String, dynamic> json) {
    return FavoriteMessage(message: json["message"] ?? "");
  }
}