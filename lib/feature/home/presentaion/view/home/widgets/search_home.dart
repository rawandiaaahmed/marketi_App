// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:flutter_application_1/core/constants/asset_manager.dart';

import 'package:flutter_application_1/core/theme/app_style.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AssetManager.search),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                "What are you looking for ?",
                style: AppStyles.searchLines2Style,
              ),
            ),
            Image.asset(AssetManager.searchFilter),
          ],
        ),
      ),
    );
  }
}
