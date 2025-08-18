import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';

class ProductCardHome extends StatelessWidget {
  const ProductCardHome({
    Key? key,
    required this.image,
    required this.price,
    required this.name,
    required this.rate,
    required this.onTap,
   required this.onAddToCart,
   required this.isFavorite,
   required this.onToggleFavorite,
  }) : super(key: key);

  final String image;
  final String price;
  final String name;
  final String rate;
  final VoidCallback onTap;
 final VoidCallback onAddToCart;  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
            /// صورة المنتج + زرار المفضلة
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                    child: Image.network(
                      image,
                      width: double.infinity,
                      height: 120.h,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: GestureDetector(
                      onTap: onToggleFavorite,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.w),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : AppColors.darkblue900,
                            size: 20.sp,
                          ),
                        ),
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
                      Text(price, style: AppStyles.detailsproductLines2Style),
                      Row(
                        children: [
                          Image.asset(AssetManager.rate),
                          SizedBox(width: 4.w),
                          Text(rate, style: AppStyles.detailsproductLines2Style),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.detailsproductLines2Style,
                  ),
                ],
              ),
            ),

            /// زرار Add
            GestureDetector(
              onTap: onAddToCart,
              child: Padding(
                padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 8.h),
                child: Container(
                  height: 30.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(color: AppColors.lightBlue100),
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
      ),
    );
  }
}