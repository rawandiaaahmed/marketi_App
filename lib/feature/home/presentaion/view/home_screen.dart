import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/banner_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/brands_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/catrgory_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/popular_product.dart';

import 'package:flutter_application_1/feature/home/presentaion/view/widgets/search_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/header_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/repo/product_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = RepositoryProvider.of<HomeRepository>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => HomeCubit(repository)..getProduct()..getCategories()..getBrands()),
    
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderHome(),
                    SizedBox(height: 16.h),

                    SearchHome(
                      onTap: () {
                        context.pushName(StringRoute.search);
                      },
                    ),

                    SizedBox(height: 16.h),

                    BannerHome(),
                   SizedBox(height: 20.h),

                    // // Popular Products
                    PopularProduct(),
                     SizedBox(height: 20.h),

                    // // Categories
                     const CatrgoryHome(),
                      SizedBox(height: 20.h),

                    // // Brands
                      BrandsHome(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}