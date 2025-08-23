import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/dio_consumer.dart';
import 'package:flutter_application_1/feature/auth/data/repo/auth_repository.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/auth_cubit.dart';
import 'package:flutter_application_1/feature/home/data/repo/product_repository.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_application_1/feature/profile/data/repo/profile_repository.dart';
import 'package:flutter_application_1/feature/profile/presentation/view_model/cubit/profile_cubit.dart';
import 'package:flutter_application_1/feature/profile/presentation/view_model/cubit/them_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';


final sl = GetIt.instance;

Future<void> init() async {
  
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: Dio()));

  // repositories
  sl.registerLazySingleton(() => AuthRepository(api: sl<ApiConsumer>()));
  sl.registerLazySingleton(() => HomeRepository(api: sl<ApiConsumer>()));
  sl.registerLazySingleton(() => ProfileRepository(api: sl<ApiConsumer>()));

  // cubits
  sl.registerFactory(() => UserCubit(sl()));
  sl.registerFactory(() => HomeCubit(sl()));
  sl.registerFactory(() => ProfileCubit(sl()));
  sl.registerLazySingleton(() => ThemeCubit());
}