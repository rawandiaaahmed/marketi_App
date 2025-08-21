class CategoryResponseModel {
  final List<CategoryModel> list;

  CategoryResponseModel({required this.list});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      list: (json['list'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'list': list.map((e) => e.toJson()).toList(),
    };
  }
}

class CategoryModel {
  final String slug;
  final String name;
  final String url;
  final String image;

  CategoryModel({
    required this.slug,
    required this.name,
    required this.url,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      slug: json['slug'] ?? '',
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
      'url': url,
      'image': image,
    };
  }
}