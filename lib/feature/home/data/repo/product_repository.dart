import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';

import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';
import 'package:flutter_application_1/feature/home/data/model/brands_model.dart';
import 'package:flutter_application_1/feature/home/data/model/category_model.dart';
import 'package:flutter_application_1/feature/home/data/model/product_details_modecategory.dart';
import 'package:flutter_application_1/feature/home/data/model/product_details_model_brands.dart';

import 'package:flutter_application_1/feature/home/data/model/product_model.dart';

class HomeRepository {
  final ApiConsumer api;
  HomeRepository({required this.api,});

  Future<Either<String, ProductResponse>> getProduct({
   required int limit,
   required int skip,
  }) async {
    try {
      final response = await api.get(
        EndPoint.getProduct,
        queryParameters: {
          "limit": limit,
          "skip": skip,
        },
      );

      if (response == null || response is! Map<String, dynamic>) {
        return const Left('Invalid response from server');
      }

      return Right(ProductResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, CategoryResponseModel>> getCategory({
   required int limit,
   required int skip,
  }) async {
    try {
      final response = await api.get(
        EndPoint.getCategories,
        queryParameters: {
          "limit": limit,
          "skip": skip,
        },
      );

      if (response == null || response is! Map<String, dynamic>) {
        return const Left('Invalid response from server');
      }

      return Right(CategoryResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, BrandsResponse>> getbrands({
   required int limit,
   required int skip,
  }) async {
    try {
      final response = await api.get(
        EndPoint.getBrands,
        queryParameters: {
          "limit": limit,
          "skip": skip,
        },
      );

      if (response == null || response is! Map<String, dynamic>) {
        return const Left('Invalid response from server');
      }

      return Right(BrandsResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
 Future<Either<String, ProductResponsee>> getProductbycategory({
  required String category,
  required int skip,
  required int limit,
}) async {
  try {
    final response = await api.get(
      EndPoint.productDetailsByCategory(
        category: category,
        skip: skip,
        limit: limit,
      ),
    );

    if (response == null || response is! Map<String, dynamic>) {
      return const Left('Invalid response from server');
    }

    return Right(ProductResponsee.fromJson(response));
  } on ServerException catch (e) {
    return Left(e.errModel.message);
  } catch (e) {
    return Left(e.toString());
  }
}
 Future<Either<String, ProductResponseByBrands>> getProductbyBrands({
  required String brands,
  required int skip,
  required int limit,
}) async {
  try {
    final response = await api.get(
      EndPoint.productDetailsByBrands(
        brands: brands,
        skip: skip,
        limit: limit,
      ),
    );

    if (response == null || response is! Map<String, dynamic>) {
      return const Left('Invalid response from server');
    }

    return Right(ProductResponseByBrands.fromJson(response));
  } on ServerException catch (e) {
    return Left(e.errModel.message);
  } catch (e) {
    return Left(e.toString());
  }
}
}
