import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/helper/cache_helper.dart';
import 'package:flutter_application_1/core/network/dio_consumer.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/feature/auth/data/repo/auth_repository.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/auth_cubit.dart' ;
import 'package:flutter_application_1/feature/cart/data/repo/cart_repo.dart';
import 'package:flutter_application_1/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flutter_application_1/feature/favorite/data/repo/favorite_repo.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:flutter_application_1/feature/home/data/repo/product_repository.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_application_1/feature/profile/data/repo/profile_repository.dart';
import 'package:flutter_application_1/feature/profile/presentation/view_model/cubit/profile_cubit.dart';
import 'package:flutter_application_1/feature/profile/presentation/view_model/cubit/them_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();

  final dioConsumer = DioConsumer(dio: Dio());

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(api: dioConsumer),
        ),
        RepositoryProvider(
          create: (_) => HomeRepository(api: dioConsumer),
        ),
         RepositoryProvider(
          create: (_) => ProfileRepository(api: dioConsumer),
        ),
        RepositoryProvider(
          create: (_) => CartRepository(api: dioConsumer),
        ),
        RepositoryProvider(
          create: (_) => FavoriteRepo(api: dioConsumer),
        ), 
        
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserCubit(
              RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => HomeCubit(
              RepositoryProvider.of<HomeRepository>(context),
            ),
          ),
           BlocProvider(
            create: (context) => ProfileCubit(
              RepositoryProvider.of<ProfileRepository>(context),
              
              
            ),
          ),
           BlocProvider(
            create: (context) => FavoriteCubit(
              RepositoryProvider.of<FavoriteRepo>(context),
              
              
            ),
          ),
           BlocProvider(
            create: (context) => CartCubit(
              RepositoryProvider.of<CartRepository>(context),
              
              
            ),
          ),
          
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                scaffoldBackgroundColor: AppColors.white,
                fontFamily: 'Poppins',
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: AppColors.black, 
                fontFamily: 'Poppins',
              ),
              themeMode: themeMode, 
              initialRoute: StringRoute.splash,
              onGenerateRoute: AppRoutes.onGenerateRoute,
            );
          },
        );
      },
    );
  }
}