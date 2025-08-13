import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/constants/validator.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

import 'package:flutter_application_1/core/theme/app_style.dart';

import 'package:flutter_application_1/feature/auth/presentation/view/widgets/custom_shere_widget.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/auth_cubit.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  

  bool rememberMe = false;
  bool obscurePassword = true;

  @override
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 16.h, right: 16.h),
            key: context.read<UserCubit>().signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60.h, right: 9),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Image.asset(AssetManager.back),
                    ),
                  ),
                ),

                Center(
                  child: Image.asset(
                    AssetManager.splash,
                    height: 160.h,
                    width: 187.w,
                  ),
                ),
                SizedBox(height: 5.h),
                Text('Your Name', style: AppStyles.signupHeadLinesStyle),
                SizedBox(height: 2.h),

                CustomTextField(
                  prefixIcon: Image.asset(AssetManager.name),
                  controller: context.read<UserCubit>().signUpName,
                  hintText: "Full Name",
                  validator: Validators.validateName,
                ),
                SizedBox(height: 10.h),
              //   Text('Username', style: AppStyles.signupHeadLinesStyle),
              //   SizedBox(height: 2.h),

              //   CustomTextField(
              //     prefixIcon: Image.asset(AssetManager.user),
              //     controller: context.read<UserCubit>().userName,
              //     hintText: "Username",
              //     validator: Validators.validateName,
              //  ),
              //   SizedBox(height: 10.h),

                Text("Phone Number", style: AppStyles.signupHeadLinesStyle),
                SizedBox(height: 2.h),
               
                SizedBox(height: 2.h),
                CustomTextField(
                  prefixIcon: Image.asset(AssetManager.phone),
                  controller: context.read<UserCubit>().signUpPhoneNumber,
                  hintText: "Phone Number",
                  validator: Validators.validatePhone,
                ),
                Text('Email', style: AppStyles.signupHeadLinesStyle),
                SizedBox(height: 2.h),
                CustomTextField(
                  prefixIcon: Image.asset(AssetManager.email),
                  controller: context.read<UserCubit>().signUpEmail,
                  hintText: "Username or Email",
                  validator: Validators.validateEmail,
                ),
                SizedBox(height: 10.h),
                Text('Password', style: AppStyles.signupHeadLinesStyle),
                SizedBox(height: 2.h),
                CustomTextField(
                  prefixIcon: Image.asset(AssetManager.pasword),
                  hintText: "Enter Your Password",
                 controller: context.read<UserCubit>().signUpPassword,
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

                SizedBox(height: 10.h),
                Text('Confirm Password', style: AppStyles.signupHeadLinesStyle),
                SizedBox(height: 2.h),
                CustomTextField(
                  prefixIcon: Image.asset(AssetManager.pasword),
                  hintText: "Enter Your Password",
                 controller: context.read<UserCubit>().confirmPassword,
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
                SizedBox(height: 10.h),

                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child:  state is SignUpLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(left: 10.h, right: 10.h),
        backgroundColor: AppColors.darkblue100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      onPressed: () {
        context.read<UserCubit>().signUp();
      },
      child: Text("Sign Up", style: AppStyles.primaryHeadLinesStyle),
    )

                ),
                SizedBox(height: 20.h),

                CustomShereWidget(),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
