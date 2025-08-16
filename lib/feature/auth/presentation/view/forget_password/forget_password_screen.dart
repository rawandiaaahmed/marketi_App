import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

import 'package:flutter_application_1/core/theme/app_style.dart';


import 'package:flutter_application_1/feature/auth/presentation/view/widgets/custom_buttom_forget.dart';

import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: InkWell(
            onTap: () => context.pop(),
            child: Image.asset(AssetManager.back),
          ),
        ),
      ),
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
                    Image.asset(AssetManager.forget3, height: 200.h),
                    SizedBox(height: 20.h),
                    Padding(
                  padding:  EdgeInsets.only(right: 26.h,left: 48),
                  child: Text("Please enter your phone number to receive a verification code",style: AppStyles.congrate2Lines2Style,),
                ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Phone Number",
                        style: AppStyles.signupHeadLinesStyle,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    IntlPhoneField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                      ),
                      initialCountryCode: 'EG',
                      onChanged: (phone) {},
                      validator: (phone) {
                        if (phone == null || phone.number.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomButtomForget(
                      text: 'Send Code',
                      formKey: formKey,
                      onValid: () {    context.pushName(StringRoute.verfication);},
                    ),
                    SizedBox(height: 7.h),
                    TextButton(
                      onPressed: () {
                         context.pushName(StringRoute.forget2);
                      },
                      child: Text(
                        "Try Another Way",
                        style: AppStyles.try2Lines2Style,
                      ),
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
