import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductByBrandItem extends StatelessWidget {
  final dynamic product; // استبدليها بموديل المنتج الحقيقي (ProductModel)

  const ProductByBrandItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
                      '\$${product.price.toString()}',
                      style: AppStyles.detailsproductLines2Style,
                    ),
                    Row(
                      children: [
                        Image.asset(AssetManager.rate),
                        SizedBox(width: 4.w),
                        Text(
                          product.rating.toString(),
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
        ],
      ),
    );
  }
}
