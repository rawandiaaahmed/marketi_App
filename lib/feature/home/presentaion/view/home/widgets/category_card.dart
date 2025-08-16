import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.image, required this.title});
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
     return Container(
      width: 105.w,
      height: 115.h,
      child: Column(
        children: [
          Container(
           height: 100,
           width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.lightBlue700),
             
            ),
            child: Image.asset(image),
          ),
          
          Text(title, style: AppStyles.detailsCategoryLines2Style),
        ],
      ),
    );
  }
}