import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset(AssetManager.search),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              onChanged: onChanged, 
              decoration: InputDecoration(
                hintText: "What are you looking for ?",
                hintStyle: AppStyles.searchLines2Style,
                border: InputBorder.none,
              ),
            ),
          ),
          Image.asset(AssetManager.searchFilter),
        ],
      ),
    );
  }
}