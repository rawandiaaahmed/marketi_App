import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';
import 'package:flutter_application_1/core/helper/cache_helper.dart';
import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';
import 'package:flutter_application_1/feature/auth/data/model/active_resent_model.dart';
import 'package:flutter_application_1/feature/auth/data/model/active_resent_request_model.dart';
import 'package:flutter_application_1/feature/auth/data/model/login_model.dart';
import 'package:flutter_application_1/feature/auth/data/model/login_request_model.dart';
import 'package:flutter_application_1/feature/auth/data/model/new_password_model.dart';
import 'package:flutter_application_1/feature/auth/data/model/new_password_requst_model.dart';
import 'package:flutter_application_1/feature/auth/data/model/resent_Model.dart';
import 'package:flutter_application_1/feature/auth/data/model/resent_reqest_Model.dart';
import 'package:flutter_application_1/feature/auth/data/model/sign_up_model.dart';
import 'package:flutter_application_1/feature/auth/data/model/sign_up_reques_modelt.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepository {
  final ApiConsumer api;

  AuthRepository({required this.api});
  Future<Either<String, LoginModel>> signIn(
    LoginRequestModel requst
   
  ) async {
    try {
      final response = await api.post(
        EndPoint.signIn,
        data: requst.toJson(),
      );
      final user = LoginModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.token);
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, SignUpModel>> signUp(
    SignUpRequestModel request,
  ) async {
    try {
      final response = await api.post(
        EndPoint.signUp,

        data: request.toJson(),
      );
      final signUPModel = SignUpModel.fromJson(response);
      return Right(signUPModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, ResentModel>> resentEmail(
    ResentReqestModel request
  ) async {
    try {
      final response = await api.post(
        EndPoint.resentEmail,

        data: request.toJson(),
      );
      final resentModel = ResentModel.fromJson(response);
      return Right(resentModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
   Future<Either<String, ActiveResentModel>> verification(ActiveResentRequestModel request) async {
    try {
      final response = await api.post(
        EndPoint.verfication,

        data: request.toJson(),
      );
      final verficationModel = ActiveResentModel.fromJson(response);
      return Right(verficationModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
  Future<Either<String,NewPasswordModel>> newpassword(NewPasswordRequestModel request) async {
    try {
      final response = await api.post(
        EndPoint.newpassword,

        data: request.toJson(),
      );
      final newPasswordModel = NewPasswordModel.fromJson(response);
      return Right(newPasswordModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

}
