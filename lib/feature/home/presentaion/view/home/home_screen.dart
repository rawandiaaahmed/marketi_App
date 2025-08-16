import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';

import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/banner_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/best_product.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/brands_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/buy_again_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/catrgory_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/popular_product.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/search_home.dart';

import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/header_home.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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

                  SearchHome(onTap: () {
                    context.pushName(StringRoute.search);
                  }),

                  SizedBox(height: 16.h),

                  const BannerHome(),

                  SizedBox(height: 20.h),

                  PopularProduct(),
                  SizedBox(height: 20.h),
                  CatrgoryHome(),
                  SizedBox(height: 20.h),
                  BestProduct(),
                  SizedBox(height: 20.h),
                  BrandsHome(),

                  SizedBox(height: 20.h),

                  BuyAgainHome(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
