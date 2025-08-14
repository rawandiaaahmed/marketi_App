// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/constants/validator.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/auth_cubit.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/state_cubit.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.h),
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
            child: Form(
              key: context.read<UserCubit>().newpasswordFormKey,
              child: Padding(
                padding: EdgeInsets.only(top: 70.h),
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Image.asset(AssetManager.newPassword, height: 200.h),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(right: 46.h, left: 68),
                      child: Text(
                        "New password must be different from last password",
                        style: AppStyles.congrate2Lines2Style,
                      ),
                    ),
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
                      controller: context.read<UserCubit>().newpassword,
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
                      controller: context.read<UserCubit>().newpasswordConfirm,
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

                    
                    BlocConsumer<UserCubit, UserState>(
                      listener: (context, state) {
                        if (state is NewPasswordSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)));
                              context.pushName(StringRoute.congrate);
                        } else if (state is NewPasswordFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.errMessage)));
                        }
                      },
                      builder: (context, state) {
                        if (state is NewPasswordLoading) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return ElevatedButton(
                          onPressed: () {
                            context.read<UserCubit>().newsPassword();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50.h),
                            backgroundColor: AppColors.darkblue100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            'Save Password',
                            style: AppStyles.primaryHeadLinesStyle,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}