import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';
import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';
import 'package:flutter_application_1/feature/search/data/model/filtering_model.dart';

import 'package:flutter_application_1/feature/search/data/model/search_model.dart';

class SearchRepo {
  final ApiConsumer api;

  SearchRepo({required this.api});

  Future<Either<String, SearchResponse>> searchproduct({
    required String query,
    int limit = 10,
    int skip = 0,
  }) async {
    try {
      final response = await api.post(
        EndPoint.search,

        data: {
         "search":query,
         "skip":skip,
         "limit":limit,
          },
      );
      final searchResponse = SearchResponse.fromJson(response);
      return Right(searchResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
   Future<Either<String, ProductFailterResponse>> filterProduct({
    String? query,
    String? brand,
    String? category,
    String? rating,
    String? price,
    String? discount,
    bool? popular,
    int limit = 10,
    int skip = 0,
  }) async {
    try {
      final response = await api.post(
        EndPoint.failtering,
        data: {
          "search": query,
          "brand": brand,
          "category": category,
          "rating": rating,
          "price": price,
          "discount": discount,
          "popular": popular,
          "skip": skip,
          "limit": limit,
        }..removeWhere((key, value) => value == null), 
      );
      final productFilterResponse =
          ProductFailterResponse.fromJson(response);
      return Right(productFilterResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
