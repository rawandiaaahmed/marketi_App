import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/get_it/injection_sl.dart';
import 'package:flutter_application_1/core/helper/cache_helper.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/auth_cubit.dart';
import 'package:flutter_application_1/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_application_1/feature/profile/presentation/view_model/cubit/profile_cubit.dart';
import 'package:flutter_application_1/feature/profile/presentation/view_model/cubit/them_cubit.dart';
import 'package:flutter_application_1/feature/search/presentation/view_model/cubit/search_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper().init();
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ThemeCubit>()),
        BlocProvider(create: (_) => sl<UserCubit>()),
        BlocProvider(create: (_) => sl<SearchCubit>()),
        BlocProvider(create: (_) => sl<HomeCubit>()),
        BlocProvider(create: (_) => sl<CartCubit>()),
        BlocProvider(create: (_) => sl<FavoriteCubit>()),
        BlocProvider(create: (_) => sl<ProfileCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
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
      ),
    );
  }
}
