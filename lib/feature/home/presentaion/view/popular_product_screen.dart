import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';

import 'package:flutter_application_1/core/theme/app_style.dart';

import 'package:flutter_application_1/feature/home/presentaion/view/widgets/product_cart_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/search_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularProductScreen extends StatefulWidget {
  const PopularProductScreen({super.key});

  @override
  State<PopularProductScreen> createState() => _PopularProductScreenState();
}

class _PopularProductScreenState extends State<PopularProductScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetProductSuccess ||
          current is GetProductLoading ||
          current is GetProductFailure,
      listener: (context, state) {
        if (state is GetProductFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
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
                SizedBox(width: 50.w),
                Text(
                  "Popular Product",
                  style: AppStyles.namehomeHeadLinesStyle,
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(AssetManager.homeimage),
                ),
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
                Text("All products", style: AppStyles.onboarderHeadLinesStyle),
                SizedBox(height: 10.h),
                if (state is GetProductLoading)
                  const Center(child: CircularProgressIndicator()),

                if (state is GetProductSuccess) ...[
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        if (notification.metrics.pixels >=
                            notification.metrics.maxScrollExtent) {
                          context.read<HomeCubit>().getProduct(
                            isLoadMore: true,
                          );
                        }
                        return true;
                      },
                      child: GridView.builder(
                        itemCount: state.product.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 5.w,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (context, index) {
                          final product = state.product[index];
                          return ProductCardHome(
                            product: product,
                            isFavorite: context.read<HomeCubit>().isFavorite(
                              product,
                            ),
                            onTap: () {
                              context.pushName(
                                StringRoute.productDetails,
                                arguments: product,
                              );
                            },
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
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
