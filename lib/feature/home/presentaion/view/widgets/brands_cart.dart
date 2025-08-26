import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/home/data/model/brands_model.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/product_by_brand_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsCart extends StatelessWidget {
  const BrandsCart({super.key, required this.brands});
  final BrandsModel brands;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProductByBrandScreen(
                                      brand: brands.name,
                                    ),
                                  ),
                                );
      },
      child: Container(
        width: 120.w,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            Container(
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.lightBlue700),
              ),
              alignment: Alignment.center,
              child: Text(
                brands.emoji,
                style: AppStyles.detailsCategoryLines2Style.copyWith(
                  fontSize: 30.sp,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              brands.name,
              style: AppStyles.detailsCategoryLines2Style,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
