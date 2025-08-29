
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';

import 'package:flutter_application_1/feature/auth/presentation/view_model/auth_cubit.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/state_cubit.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/constants/validator.dart';
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
  bool rememberMe = false;
  bool obscurePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Form(
          key: _formKey,
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

              // Email
              CustomTextField(
                prefixIcon: Image.asset(AssetManager.email),
                controller: emailController,
                hintText: "Username or Email",
                validator: Validators.validateEmail,
              ),
              SizedBox(height: 13.h),

              // Password
              CustomTextField(
                prefixIcon: Image.asset(AssetManager.pasword),
                hintText: "Enter Your Password",
                controller: passwordController,
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

              // Remember & Forgot
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
                      context.pushName(StringRoute.forget2);
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
                child: BlocConsumer<UserCubit, UserState>(
                  listener: (context, state) {
                    if (state is SignInSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)));

                      context.read<HomeCubit>().getProduct();

                      context.pushReplacementNamed(StringRoute.bottomBar);
                    } else if (state is SignInFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errMessage)));
                    }
                  },
                  builder: (context, state) {
                    if (state is SignInLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomButton(
                      text: 'Log In',
                      formKey: _formKey,
                      onValid: () {
                        context.read<UserCubit>().signIn(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 20.h),
              CustomShereWidget(),
              SizedBox(height: 30.h),

              // Register
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