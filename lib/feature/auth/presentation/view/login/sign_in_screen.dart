import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/constants/validator.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

import 'package:flutter_application_1/feature/auth/presentation/view/widgets/custom_button.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/widgets/custom_shere_widget.dart';

import 'package:flutter_application_1/feature/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool rememberMe = false;
  bool obscurePassword = true;
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.h, right: 9),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Image.asset(AssetManager.skip),
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              Image.asset(AssetManager.splash, height: 232.h, width: 272.w),
              SizedBox(height: 35.h),

              CustomTextField(
                prefixIcon: Image.asset(AssetManager.email),
                controller: email,
                hintText: "Username or Email",
                validator: Validators.validateEmail,
              ),
              SizedBox(height: 13.h),

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
                    obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.black,
                    size: 17.h,
                  ),
                ),
                validator: Validators.validatePassword,
              ),

              SizedBox(height: 5.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (v) {
                          setState(() {
                            rememberMe = v ?? false;
                          });
                        },
                      ),
                      Text(
                        "Remember Me",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.mediumGrey,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushName(StringRoute.forget);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.lightBlue100,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: CustomButton(
                  text: 'Log In',
                  formKey: formKey,
                  onValid: () {},
                ),
              ),
              SizedBox(height: 20.h),

              CustomShereWidget(),
              SizedBox(height: 30.h),

              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Are you new in Marketi",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.mediumGrey,
                      ),
                    ),
                    SizedBox(width: 3),
                    InkWell(
                      onTap: () {
                        context.pushName(StringRoute.signUp);
                      },
                      child: Text(
                        "register?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.lightBlue100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
