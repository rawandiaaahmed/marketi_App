import 'package:flutter_application_1/feature/home/data/model/brands_model.dart';
import 'package:flutter_application_1/feature/home/data/model/category_model.dart';
import 'package:flutter_application_1/feature/home/data/model/product_details_modecategory.dart';
import 'package:flutter_application_1/feature/home/data/model/product_details_model_brands.dart';

import 'package:flutter_application_1/feature/home/data/model/product_model.dart';
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetProductSuccess extends HomeState {
  final List<ProductModel> product;



  GetProductSuccess({
    required this.product,
   
  });
}

final class GetProductLoading extends HomeState {}

final class GetProductFailure extends HomeState {
  final String errMessage;
  GetProductFailure({required this.errMessage});
}
final class GetCategorySuccess extends HomeState {
  final List<CategoryModel> categories;

  GetCategorySuccess({
    required this.categories,
  });
}

final class GetCategoryLoading extends HomeState {}

final class GetCategoryFailure extends HomeState {
  final String errMessage;

  GetCategoryFailure({required this.errMessage});
}
final class GetBrandSuccess extends HomeState {
  final List<BrandsModel> brands;

  GetBrandSuccess({
    required this.brands,
  });
}
final class GetBrandLoading extends HomeState {}
final class GetBrandFailure extends HomeState {
  final String errMessage;

  GetBrandFailure({required this.errMessage});
}
final class GetProductbycategorySuccess extends HomeState {
  final List<ProductModelBycategory> products;



  GetProductbycategorySuccess({
    required this.products,
   
  });
}

final class GetProductbycategoryLoading extends HomeState {}

final class GetProductbycategoryFailure extends HomeState {
  final String errMessage;
 GetProductbycategoryFailure({required this.errMessage});
}
final class GetProductbyBrandSuccess extends HomeState {
  final List<ProductModelByBrands> productBrand;



  GetProductbyBrandSuccess({
    required this.productBrand,
   
  });
}

final class GetProductbyBrandLoading extends HomeState {}

final class GetProductbyBrandFailure extends HomeState {
  final String errMessage;
 GetProductbyBrandFailure({required this.errMessage});
}
