class CartMessageResponse {
  final String message;
  CartMessageResponse({required this.message});

  factory CartMessageResponse.fromJson(Map<String, dynamic> json) {
    return CartMessageResponse(message: json["message"] ?? "");
  }
}