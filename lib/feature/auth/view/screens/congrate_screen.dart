import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/auth/view/screens/sign_in_screen.dart';
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
              Image.asset(AssetManager.congratulation ),
            
            SizedBox(height: 25.h),
             Image.asset(AssetManager.forget9, ),
               SizedBox(height: 25.h),
              ElevatedButton(
                    onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );},
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