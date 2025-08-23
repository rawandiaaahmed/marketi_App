class FavoriteResponse {
  final List<FavoriteModel> list;

  FavoriteResponse({required this.list});

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteResponse(
      list: (json['list'] as List)
          .map((e) => FavoriteModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'list': list.map((e) => e.toJson()).toList(),
    };
  }
}

class FavoriteModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final CartDimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<CartReview> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final CartMeta meta;
  final List<String> images;
  final String thumbnail;

 FavoriteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'],
      tags: List<String>.from(json['tags']),
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight'],
      dimensions: CartDimensions.fromJson(json['dimensions']),
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews: (json['reviews'] as List)
          .map((e) => CartReview.fromJson(e))
          .toList(),
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      meta: CartMeta.fromJson(json['meta']),
      images: List<String>.from(json['images']),
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions.toJson(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta.toJson(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }
}

class CartDimensions {
  final double width;
  final double height;
  final double depth;

  CartDimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory CartDimensions.fromJson(Map<String, dynamic> json) {
    return CartDimensions(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'depth': depth,
    };
  }
}

class CartReview {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  CartReview({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory CartReview.fromJson(Map<String, dynamic> json) {
    return CartReview(
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'],
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'comment': comment,
      'date': date,
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }
}

class CartMeta {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;

  CartMeta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory CartMeta.fromJson(Map<String, dynamic> json) {
    return CartMeta(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      barcode: json['barcode'],
      qrCode: json['qrCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'barcode': barcode,
      'qrCode': qrCode,
    };
  }
}