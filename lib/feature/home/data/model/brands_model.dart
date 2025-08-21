class BrandsResponse {
  final List<BrandsModel> list;

  BrandsResponse({required this.list});

  factory BrandsResponse.fromJson(Map<String, dynamic> json) {
    return BrandsResponse(
      list: (json['list'] as List)
          .map((e) => BrandsModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'list': list.map((e) => e.toJson()).toList(),
    };
  }
}

class BrandsModel {
  final String name;
  final String emoji;

  BrandsModel({required this.name, required this.emoji});

  factory BrandsModel.fromJson(Map<String, dynamic> json) {
    return BrandsModel(
      name: json['name'] ?? '',
      emoji: json['emoji'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'emoji': emoji,
    };
  }
}