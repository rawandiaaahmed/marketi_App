import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/constants/validator.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/auth/view/screens/verification_email_screen.dart';

import 'package:flutter_application_1/feature/auth/view/widgets/custom_buttom_forget.dart';
import 'package:flutter_application_1/feature/auth/view/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordEmailScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();

  ForgotPasswordEmailScreen({super.key});

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
                padding:  EdgeInsets.only(top: 70.h),
                child: Column(
                  children: [
                    
                    SizedBox(height: 30.h),
                    Image.asset(AssetManager.forget4, height: 200.h),
                    SizedBox(height: 20.h),
                   Image.asset(AssetManager.forget1),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Email",style: AppStyles.signupHeadLinesStyle),
                    ),
                    
              SizedBox(height: 2.h),
              CustomTextField(
                prefixIcon: Image.asset(AssetManager.email),
                controller: email,
                hintText: "you@gmail.com",
                validator: Validators.validateEmail,
              ),
                    SizedBox(height: 20.h),
                    CustomButtomForget(text: 'Send Code',formKey: formKey,onValid: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VerificationemailScreen(),
                          ),
                        );
                  },),
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

