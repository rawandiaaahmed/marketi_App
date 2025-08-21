import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';

import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductByCategoryScreen extends StatelessWidget {
  final String category;
  const ProductByCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().getProductbycategory(category: category);

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
            SizedBox(width: 70.w),
            Text(AppStrings.category, style: AppStyles.namehomeHeadLinesStyle),
            const Spacer(),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(AssetManager.homeimage),
            ),
          ],
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetProductbycategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetProductbycategoryFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is GetProductbycategorySuccess) {
            return GridView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: state.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 20.w,
                childAspectRatio: 1.4,
              ),
              itemBuilder: (context, index) {
                final product = state.products[index];
                return Container(
                  width: 164.w,
                  height: 400.h,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade300),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.r),
                                topRight: Radius.circular(12.r),
                              ),
                              child: Image.network(
                                product.thumbnail,
                                width: double.infinity,
                                height: 420.h,

                                errorBuilder: (_, __, ___) => Container(
                                  color: Colors.grey.shade200,
                                  child: const Icon(Icons.image_not_supported),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.price.toString(),
                                  style: AppStyles.detailsproductLines2Style,
                                ),
                                Row(
                                  children: [
                                    Image.asset(AssetManager.rate),
                                    SizedBox(width: 4.w),
                                    Text(
                                      product.rating.toString(),
                                      style:
                                          AppStyles.detailsproductLines2Style,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              product.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.detailsproductLines2Style,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
