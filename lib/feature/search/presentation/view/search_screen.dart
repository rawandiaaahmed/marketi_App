import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/widget/louding_cubit.dart';
import 'package:flutter_application_1/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:flutter_application_1/feature/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  final List<bool> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(AssetManager.back),
            ),
          ],
        ),
      ),
      body: InkWell(
        onTap: () {
          context.pushName(StringRoute.productDetails);
        },
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "What are you looking for?",
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) {
                          context.read<SearchCubit>().search(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return ProductLoadingWidget();
                    } else if (state is Searchsuccess) {
                      if (favorites.length < state.search.length) {
                        favorites.addAll(
                          List.filled(
                            state.search.length - favorites.length,
                            false,
                          ),
                        );
                      }
                      return GridView.builder(
                        itemCount: state.search.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 5.w,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (context, index) {
                          final product = state.search[index];
                          return Container(
                            width: 164.w,
                            height: 200.h,
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
                                      Padding(
                                        padding: EdgeInsets.all(8.h),
                                        child: Container(
                                          height: 96.h,
                                          width: 167.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.circular(
                                              5.r,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              5.r,
                                            ),
                                            child: Image.network(
                                              product.thumbnail.toString(),
                                              width: double.infinity,
                                              height: 120.h,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                    return Center(
                                                      child: Icon(Icons.error),
                                                    );
                                                  },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 8.h,
                                        right: 8.w,
                                        child: InkWell(
                                          onTap: () {
                                            context
                                                .read<FavoriteCubit>()
                                                .addFavorite(product.id);
                                          },
                                          child: Icon(
                                            favorites[index]
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: favorites[index]
                                                ? Colors.black
                                                : AppColors.darkblue900,
                                            size: 22.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${product.price}',
                                            style: AppStyles
                                                .detailsproductLines2Style,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(AssetManager.rate),
                                              SizedBox(width: 4.w),
                                              Text(
                                                "${product.rating}",
                                                style: AppStyles
                                                    .detailsproductLines2Style,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        product.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            AppStyles.detailsproductLines2Style,
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.read<CartCubit>().addToCart(
                                      product.id,
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.h,
                                      right: 20.h,
                                      bottom: 8.h,
                                    ),
                                    child: Container(
                                      height: 30.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          14.r,
                                        ),
                                        border: Border.all(
                                          color: Colors.lightBlue.shade100,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Add",
                                          style: AppStyles.producLines2Style,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (state is SearchFailuer) {
                      return Center(child: Text("Error: ${state.errMessage}"));
                    }
                    return Center(child: Text("Type something to search"));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
