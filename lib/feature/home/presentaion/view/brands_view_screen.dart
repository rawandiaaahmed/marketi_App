import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/core/widget/louding_cubit.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/brands_cart.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/search_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsScreen extends StatefulWidget {
  BrandsScreen({super.key});

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetBrandSuccess ||
          current is GetBrandLoading ||
          current is GetBrandFailure,
      listener: (context, state) {
        if (state is GetBrandFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(AssetManager.back),
                ),
                SizedBox(width: 90.w),
                Text(AppStrings.brands, style: AppStyles.namehomeHeadLinesStyle),
                
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchHome(onTap: () {}),
                SizedBox(height: 10.h),
                Text(AppStrings.brand, style: AppStyles.onboarderHeadLinesStyle),
                SizedBox(height: 10.h),
                if (state is GetBrandLoading)
                   ProductLoadingWidget(),
                if (state is GetBrandSuccess)
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.brands.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 20.w,
                        childAspectRatio: 1.0
                      ),
                      itemBuilder: (context, index) {
                        final brand = state.brands[index];
                        return BrandsCart(brands: brand);
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}