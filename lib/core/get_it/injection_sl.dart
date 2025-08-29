import 'package:dio/dio.dart' show Dio;
import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/dio_consumer.dart';
import 'package:flutter_application_1/feature/auth/data/repo/auth_repository.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/auth_cubit.dart';
import 'package:flutter_application_1/feature/cart/data/repo/cart_repo.dart';
import 'package:flutter_application_1/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flutter_application_1/feature/favorite/data/repo/favorite_repo.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:flutter_application_1/feature/home/data/repo/product_repository.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_application_1/feature/profile/data/repo/profile_repository.dart';
import 'package:flutter_application_1/feature/profile/presentation/view_model/cubit/profile_cubit.dart';
import 'package:flutter_application_1/feature/profile/presentation/view_model/cubit/them_cubit.dart';
import 'package:flutter_application_1/feature/search/data/repo/search_repo.dart';
import 'package:flutter_application_1/feature/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: Dio()));

  // repositories
  sl.registerLazySingleton(() => AuthRepository(api: sl<ApiConsumer>()));
  sl.registerLazySingleton(() => HomeRepository(api: sl<ApiConsumer>()));
  sl.registerLazySingleton(() => ProfileRepository(api: sl<ApiConsumer>()));
  sl.registerLazySingleton(() => CartRepository(api: sl<ApiConsumer>()));
  sl.registerLazySingleton(() => FavoriteRepo(api: sl<ApiConsumer>()));
  sl.registerLazySingleton(() => SearchRepo(api: sl<ApiConsumer>()));

  // cubits
  sl.registerFactory(() => UserCubit(sl()));
  sl.registerFactory(() => HomeCubit(sl()));
  sl.registerFactory(() => ProfileCubit(sl()));
  sl.registerFactory(() => SearchCubit(sl()));
  sl.registerFactory(() => CartCubit(sl()));
  sl.registerFactory(() => FavoriteCubit(sl()));
  sl.registerLazySingleton(() => ThemeCubit());
}