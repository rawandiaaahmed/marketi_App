import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';

import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';


import 'package:flutter_application_1/feature/favorite/data/model/favorite_message.dart';
import 'package:flutter_application_1/feature/favorite/data/model/favorite_model.dart';

class FavoriteRepo {
  final ApiConsumer api;
  FavoriteRepo({required this.api});

  Future<Either<String, FavoriteResponse>> favorite() async {
    try {
      final response = await api.get(EndPoint.getfavorite);
      return Right(FavoriteResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, FavoriteMessage>> addfavorite(int productId) async {
    try {
      final response = await api.post(
        EndPoint.postfavorite,
      data: {
          "productId": productId,
        },
      );
      return Right(FavoriteMessage.fromJson(response)); 
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
  Future<Either<String, FavoriteMessage>> deleteFavorite(int productId) async {
  try {
    final response = await api.delete(
      EndPoint.deletefavorite,
      data: {
          "productId": productId,
        },
    );
    return Right(FavoriteMessage.fromJson(response));
  } on ServerException catch (e) {
    return Left(e.errModel.message);
  }
}
}
