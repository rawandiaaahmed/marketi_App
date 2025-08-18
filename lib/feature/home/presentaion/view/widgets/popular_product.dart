import 'package:flutter/material.dart';

import 'package:flutter_application_1/feature/home/presentaion/view/widgets/product_cart_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/section_header.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/product_cubit.dart';
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
    return BlocBuilder<ProductCubit, ProductState>(
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

                    return ProductCardHome(
                      image: product.thumbnail,
                      name: product.title,
                      price: product.price.toString(),
                      rate: product.rating.toString(),
                      isFavorite: context.read<ProductCubit>().isFavorite(
                        product,
                      ),
                      onTap: () {},
                      onAddToCart: () {
                        context.read<ProductCubit>().addToCart(product);
                      },
                      onToggleFavorite: () {
                        context.read<ProductCubit>().toggleFavorite(product);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),

              if (state.hasMore)
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ProductCubit>().getProduct(loadMore: true);
                    },
                    child: const Text("Load More"),
                  ),
                ),
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
