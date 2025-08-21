import 'package:flutter/material.dart';

import 'package:flutter_application_1/feature/home/presentaion/view/widgets/product_cart_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/section_header.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is GetProductSuccess || current is GetProductLoading || current is GetProductFailure,
      listener: (context, state) {
        if (state is GetProductFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: "Popular Product",
              onTap: () {
                context.pushName(StringRoute.popularProduct);
              },
            ),
            SizedBox(height: 8.h),

            if (state is GetProductLoading)
              const Center(child: CircularProgressIndicator()),

            if (state is GetProductSuccess) ...[
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.product.length,
                  itemBuilder: (context, index) {
                    final product = state.product[index];
//todo
                    return ProductCardHome(
                      product: product,
                      isFavorite: context.read<HomeCubit>().isFavorite(
                        product,
                      ),
                      onTap: () {  context.pushName(
                                StringRoute.productDetails,
                                arguments: product,
                              );},
                      onAddToCart: () {
                        context.read<HomeCubit>().addToCart(product);
                      },
                      onToggleFavorite: () {
                        context.read<HomeCubit>().toggleFavorite(product);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),
            ],

            if (state is GetProductFailure)
              Center(
                child: Text(
                  state.errMessage,
                  style: AppStyles.congrateLines2Style,
                ),
              ),
          ],
        );
      },
    );
  }
}
