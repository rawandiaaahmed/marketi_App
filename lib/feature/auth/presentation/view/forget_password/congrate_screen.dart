import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';

class CongrateScreen extends StatefulWidget {
  const CongrateScreen({super.key});

  @override
  State<CongrateScreen> createState() => _CongrateScreenState();
}

class _CongrateScreenState extends State<CongrateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.only(left: 10.h),
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Image.asset(AssetManager.back),
          ),
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
                         
            SizedBox(height: 30.h),
                    
              Image.asset(AssetManager.congratulations, height: 200.h),
            SizedBox(height: 20.h),
           Text('Congratulations',style: AppStyles.congrateLines2Style,),
            
            SizedBox(height: 25.h),
             Padding(
               padding:  EdgeInsets.only(right: 26.h,left: 18.h),
               child: Text("You have updated the password.please login again with your latest password",style: AppStyles.congrate2Lines2Style,),
             ),
               SizedBox(height: 25.h),
              ElevatedButton(
                    onPressed: () {    context.pushName(StringRoute.signin);},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50.h),
                      backgroundColor: AppColors.darkblue100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text("Log In", style: AppStyles.primaryHeadLinesStyle,),
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