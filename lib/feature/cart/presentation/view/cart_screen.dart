import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/app_string.dart';

import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';

import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(AssetManager.back),
            ),
            SizedBox(width: 100.w),
            Text(AppStrings.cart4, style: AppStyles.namehomeHeadLinesStyle),
            const Spacer(),
           CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(AssetManager.homeimage),
                      ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Padding(
              padding: EdgeInsets.only(top: 70.h),
              child: Column(
                children: [
                         
         
                    
              Image.asset(AssetManager.cartimage, height: 200.h),
            SizedBox(height: 20.h),
           Text(AppStrings.cart3,style: AppStyles.congrateLines2Style,),

            SizedBox(height: 25.h),
             Padding(
               padding:  EdgeInsets.only(right: 26.h,left: 18.h),
               child: Text(AppStrings.cart2,style: AppStyles.congrate2Lines2Style,),
             ),
               SizedBox(height: 25.h),
              ElevatedButton(
                    onPressed: () { context.pushName(StringRoute.cart);},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50.h),
                      backgroundColor: AppColors.darkblue100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(AppStrings.startShopping, style: AppStyles.primaryHeadLinesStyle,),
                  ),
                ]
              )
            )
          )
        )
      )
              );
  }
}