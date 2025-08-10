import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/constants/validator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/auth/view/screens/congrate_screen.dart';

import 'package:flutter_application_1/feature/auth/view/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(top: 70.h),
                child: Column(
                  children: [
             
SizedBox(height: 30.h),
        
                Image.asset(AssetManager.newPassword, height: 200.h),
              SizedBox(height: 20.h),
                Image.asset(AssetManager.forget7, ),
              
SizedBox(height: 20.h),
        
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: AppStyles.signupHeadLinesStyle,
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  prefixIcon: Image.asset(AssetManager.pasword),
                  hintText: "Enter Your Password",
                  controller: password,
                  isPassword: obscurePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    child: Icon(
                      obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.black,
                      size: 17.h,
                    ),
                  ),
                  validator: Validators.validatePassword,
                ),
                SizedBox(height: 10.h),

        
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Password',
                    style: AppStyles.signupHeadLinesStyle,
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  prefixIcon: Image.asset(AssetManager.pasword),
                  hintText: "Enter Your Password",
                  controller: confirmPassword,
                  isPassword: obscurePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    child: Icon(
                      obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.black,
                      size: 17.h,
                    ),
                  ),
                  validator: Validators.validatePassword,
                ),
                SizedBox(height: 5.h),

    
                 ElevatedButton(
                    onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CongrateScreen(),
                          ),
                        );},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50.h),
                      backgroundColor: AppColors.darkblue100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text("Save Password", style: AppStyles.primaryHeadLinesStyle,),
                  ),
              ],
            ),
          ),
        ),
      ),
        )
      )
    );
  }
}