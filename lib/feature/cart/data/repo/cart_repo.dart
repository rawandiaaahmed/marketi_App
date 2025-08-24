import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';

import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';
import 'package:flutter_application_1/feature/cart/data/model/cart_items_model.dart';
import 'package:flutter_application_1/feature/cart/data/model/cart_message.dart';

class CartRepository {
  final ApiConsumer api;
  CartRepository({required this.api});

  Future<Either<String, CartResponse>> getUsercart() async {
    try {
      final response = await api.get(EndPoint.getcart);
      return Right(CartResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, CartMessageResponse>> addToCart(int productId) async {
    try {
      final response = await api.post(
        EndPoint.postcart,
      data: {
          "productId": productId,
        },
      );
      return Right(CartMessageResponse.fromJson(response)); 
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
  Future<Either<String, CartMessageResponse>> deleteFromCart(int productId) async {
  try {
    final response = await api.delete(
      EndPoint.deletecart,
      data: {
          "productId": productId,
        },
    );
    return Right(CartMessageResponse.fromJson(response));
  } on ServerException catch (e) {
    return Left(e.errModel.message);
  }
}
}
