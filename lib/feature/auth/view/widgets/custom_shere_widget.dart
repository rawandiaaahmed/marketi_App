import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShereWidget extends StatelessWidget {
  const CustomShereWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Or Continue With",
          style: TextStyle(fontSize: 14.sp, color: AppColors.mediumGrey),
          
        ),
        SizedBox(height: 10.h,),
         Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetManager.google, height: 40.h),
                  SizedBox(width: 20.w),
                  Image.asset(AssetManager.apple, height: 40.h),
                  SizedBox(width: 20.w),
                  Image.asset(AssetManager.facebook, height: 40.h),
                ],
              )
      ],
    );
  }
}
