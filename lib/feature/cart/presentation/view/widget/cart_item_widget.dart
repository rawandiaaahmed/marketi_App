import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  final dynamic product;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const CartItemWidget({
    super.key,
    required this.product,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final discountedPrice =
        (product.price - (product.price * (product.discountPercentage / 100)))
            .toStringAsFixed(2);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                product.thumbnail,
                width: 107.w,
                height: 108.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: AppStyles.onboarderLines2Style,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: onDelete,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.h,
                            horizontal: 2.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.shade200,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),

                  Text(
                    product.description,
                    style: AppStyles.detailsLines2Style,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),

                  Row(
                    children: [
                      Text(
                        '\$$discountedPrice',
                        style: AppStyles.detailsproductLines2Style,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '-${product.discountPercentage}%',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.lightBlue700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Image.asset(AssetManager.rate),
                      SizedBox(width: 4.w),
                      Text(
                        '${product.rating}',
                        style: AppStyles.detailsproductLines2Style,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
