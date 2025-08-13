import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';

import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/constants/validator.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';

import 'package:flutter_application_1/feature/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/auth_cubit.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordEmailScreen extends StatelessWidget {
  ForgotPasswordEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is ResentSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message))
          );
           context.pushName(
                                  StringRoute.verfication2,
                                );
        } else if (state is ResentFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Form(
                key: context.read<UserCubit>().resentFormKey,
                child: Padding(
                  padding: EdgeInsets.only(top: 70.h),
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      Image.asset(AssetManager.forget4, height: 200.h),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.only(right: 26.h, left: 48),
                        child: Text(
                          "Please enter your email address to receive a verification code",
                          style: AppStyles.congrate2Lines2Style,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email",
                          style: AppStyles.signupHeadLinesStyle,
                        ),
                      ),

                      SizedBox(height: 2.h),
                      CustomTextField(
                        prefixIcon: Image.asset(AssetManager.email),
                        controller: context.read<UserCubit>().resentEmail,
                        hintText: "you@gmail.com",
                        validator: Validators.validateEmail,
                      ),
                      SizedBox(height: 20.h),
                      state is ResentLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                context.read<UserCubit>().resent();
                               
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50.h),
                                backgroundColor: AppColors.darkblue100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              child: Text(
                                'Send Code',
                                style: AppStyles.primaryHeadLinesStyle,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
