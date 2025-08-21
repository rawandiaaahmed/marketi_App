import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/home/data/model/category_model.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/product_by_category_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () {
        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProductByCategoryScreen(
                                      category: category.name,
                                    ),
                                  ),
                                );
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.lightBlue700),
              ),
              child: Image.network(
                category.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            category.name,
            style: AppStyles.detailsCategoryLines2Style,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}