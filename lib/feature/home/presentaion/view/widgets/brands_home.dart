import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/brands_cart.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/section_header.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsHome extends StatelessWidget {
  const BrandsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetBrandSuccess ||
          current is GetBrandLoading ||
          current is GetBrandFailure,
      listener: (context, state) {
        if (state is GetBrandFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            SectionHeader(
              title: "Brands",
              onTap: () {
                context.pushName(StringRoute.brands);
              },
            ),
            SizedBox(height: 8.h),
            if (state is GetBrandLoading)
              const Center(child: CircularProgressIndicator()),
            if (state is GetBrandSuccess)
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.brands.length,
                  itemBuilder: (context, index) {
                    final brand = state.brands[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: BrandsCart(brands: brand),
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}