import 'dart:convert';

ProductFailterResponse productFailterResponseFromJson(String str) =>
    ProductFailterResponse.fromJson(json.decode(str));

String productFailterResponseToJson(ProductFailterResponse data) =>
    json.encode(data.toJson());

class ProductFailterResponse {
  final List<ProductFailter> list;
  final int total;
  final int skip;
  final int limit;

  ProductFailterResponse({
    required this.list,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductFailterResponse.fromJson(Map<String, dynamic> json) =>
      ProductFailterResponse(
        list: json["list"] == null
            ? []
            : List<ProductFailter>.from(
                json["list"].map((x) => ProductFailter.fromJson(x))),
        total: json["total"] ?? 0,
        skip: json["skip"] ?? 0,
        limit: json["limit"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class ProductFailter {
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
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  ProductFailter({
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

  factory ProductFailter.fromJson(Map<String, dynamic> json) => ProductFailter(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        category: json["category"] ?? "",
        price: (json["price"] ?? 0).toDouble(),
        discountPercentage: (json["discountPercentage"] ?? 0).toDouble(),
        rating: (json["rating"] ?? 0).toDouble(),
        stock: json["stock"] ?? 0,
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"].map((x) => x)),
        brand: json["brand"] ?? "",
        sku: json["sku"] ?? "",
        weight: json["weight"] ?? 0,
        dimensions: json["dimensions"] == null
            ? Dimensions(width: 0, height: 0, depth: 0)
            : Dimensions.fromJson(json["dimensions"]),
        warrantyInformation: json["warrantyInformation"] ?? "",
        shippingInformation: json["shippingInformation"] ?? "",
        availabilityStatus: json["availabilityStatus"] ?? "",
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"].map((x) => Review.fromJson(x))),
        returnPolicy: json["returnPolicy"] ?? "",
        minimumOrderQuantity: json["minimumOrderQuantity"] ?? 0,
        meta: json["meta"] == null
            ? Meta(
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                barcode: "",
                qrCode: "")
            : Meta.fromJson(json["meta"]),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"].map((x) => x)),
        thumbnail: json["thumbnail"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions.toJson(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus": availabilityStatus,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "returnPolicy": returnPolicy,
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "thumbnail": thumbnail,
      };
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: (json["width"] ?? 0).toDouble(),
        height: (json["height"] ?? 0).toDouble(),
        depth: (json["depth"] ?? 0).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "depth": depth,
      };
}

class Review {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"] ?? 0,
        comment: json["comment"] ?? "",
        date: json["date"] == null
            ? DateTime.now()
            : DateTime.tryParse(json["date"]) ?? DateTime.now(),
        reviewerName: json["reviewerName"] ?? "",
        reviewerEmail: json["reviewerEmail"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "comment": comment,
        "date": date.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
      };
}

class Meta {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: json["createdAt"] == null
            ? DateTime.now()
            : DateTime.tryParse(json["createdAt"]) ?? DateTime.now(),
        updatedAt: json["updatedAt"] == null
            ? DateTime.now()
            : DateTime.tryParse(json["updatedAt"]) ?? DateTime.now(),
        barcode: json["barcode"] ?? "",
        qrCode: json["qrCode"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
      };
}