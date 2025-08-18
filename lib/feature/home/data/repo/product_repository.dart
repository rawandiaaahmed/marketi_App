import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';

import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';
import 'package:flutter_application_1/feature/home/data/model/product_model.dart';

class ProductRepository {
  final ApiConsumer api;
  ProductRepository({required this.api});

  Future<Either<String, ProductResponse>> getProduct({
    int limit = 10,
    int skip = 0,
  }) async {
    try {
      final response = await api.get(
        EndPoint.getProduct(),
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
}