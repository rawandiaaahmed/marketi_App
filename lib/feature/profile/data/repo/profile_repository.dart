
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';

import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';
import 'package:flutter_application_1/feature/profile/data/model/profile_model.dart';

class ProfileRepository {
  final ApiConsumer api;
  ProfileRepository({required this.api});
  Future<Either<String, ProfileModel>> getUserProfile() async {
    try {
      final response = await api.get(EndPoint.getUserData);
      return Right(ProfileModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
   Future<Either<String, ProfileModel>> uploadProfileImage({
    required String userId,
    required File imageFile,
  }) async {
    try {
      final response = await api.post(
        EndPoint.postimageData,
        data: {
          "id": userId,
          "image": await MultipartFile.fromFile(
            imageFile.path,
            filename: imageFile.path.split('/').last,
          ),
        },
        isFromData: true, 
      );
      return Right(ProfileModel.fromJson(response));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
