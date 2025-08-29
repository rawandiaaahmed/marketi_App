import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/banner_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/brands_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/catrgory_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/popular_product.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/header_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_application_1/feature/search/presentation/view/widgets/filter_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/get_it/injection_sl.dart';
import '../../../../core/Router/route.dart';
import '../../../../core/Router/route_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>()
        ..getProduct()
        ..getCategories()
        ..getBrands(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderHome(),
                SizedBox(height: 16.h),

                
                GestureDetector(
                  onTap: () {
                    context.pushName(StringRoute.search);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(AssetManager.search),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            "What are you looking for ?",
                            style: AppStyles.searchLines2Style,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (_) => const FilterBottomSheet(),
                            );
                          },
                          child: Image.asset(AssetManager.searchFilter),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16.h),
           BannerHome(),
                SizedBox(height: 20.h),

                // Popular Products
                const PopularProduct(),
                SizedBox(height: 20.h),

                // Categories
                const CatrgoryHome(),
                SizedBox(height: 20.h),

                // Brands
                const BrandsHome(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}