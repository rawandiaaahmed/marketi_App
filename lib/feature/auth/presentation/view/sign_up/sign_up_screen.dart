import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/constants/validator.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/widgets/custom_button.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/widgets/custom_shere_widget.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/widgets/custom_text_field.dart';

import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController userName = TextEditingController();

  bool rememberMe = false;
  bool obscurePassword = true;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    confirmPassword.dispose();
    userName.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16.h, right: 16.h),
        key: formKey,
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
              controller: name,
              hintText: "Full Name",
              validator: Validators.validateName,
            ),
            SizedBox(height: 10.h),
            Text('Username', style: AppStyles.signupHeadLinesStyle),
            SizedBox(height: 2.h),

            CustomTextField(
              prefixIcon: Image.asset(AssetManager.user),
              controller: userName,
              hintText: "Username",
              validator: Validators.validateName,
            ),
            SizedBox(height: 10.h),

            Text("Phone Number", style: AppStyles.signupHeadLinesStyle),
            SizedBox(height: 2.h),
            IntlPhoneField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
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

            Text('Email', style: AppStyles.signupHeadLinesStyle),
            SizedBox(height: 2.h),
            CustomTextField(
              prefixIcon: Image.asset(AssetManager.email),
              controller: email,
              hintText: "Username or Email",
              validator: Validators.validateEmail,
            ),
            SizedBox(height: 10.h),
            Text('Password', style: AppStyles.signupHeadLinesStyle),
            SizedBox(height: 2.h),
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

            SizedBox(height: 10.h),
            Text('Confirm Password', style: AppStyles.signupHeadLinesStyle),
            SizedBox(height: 2.h),
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
              child: CustomButton(
                text: 'Sign Up',
                formKey: formKey,
                onValid: () {},
              ),
            ),
            SizedBox(height: 20.h),

            CustomShereWidget(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
