import 'package:flutter_application_1/feature/home/data/model/product_model.dart';
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductSuccess extends ProductState {
  final List<ProductModel> product;
  final bool hasMore;

  GetProductSuccess({
    required this.product,
    required this.hasMore,
  });
}

final class GetProductLoading extends ProductState {}

final class GetProductFailure extends ProductState {
  final String errMessage;
  GetProductFailure({required this.errMessage});
}