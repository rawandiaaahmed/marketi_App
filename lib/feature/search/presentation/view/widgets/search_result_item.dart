import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultItem extends StatelessWidget {
  final dynamic product;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const SearchResultItem({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushName(StringRoute.detalsSearch, arguments: product);
      },
      child: Container(
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
            // صورة + Favorite
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
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: Image.network(
                          product.thumbnail.toString(),
                          width: double.infinity,
                          height: 120.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(child: Icon(Icons.error));
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
                        context.read<FavoriteCubit>().addFavorite(product.id);
                        onFavoriteToggle();
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? Colors.black
                            : AppColors.darkblue900,
                        size: 22.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // تفاصيل السعر + العنوان
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: AppStyles.detailsproductLines2Style,
                      ),
                      Row(
                        children: [
                          Image.asset(AssetManager.rate),
                          SizedBox(width: 4.w),
                          Text(
                            "${product.rating}",
                            style: AppStyles.detailsproductLines2Style,
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

            // زرار Add
            GestureDetector(
              onTap: () {
                context.read<CartCubit>().addToCart(product.id);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 8.h),
                child: Container(
                  height: 30.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(color: Colors.lightBlue.shade100),
                  ),
                  child: Center(
                    child: Text("Add", style: AppStyles.producLines2Style),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
