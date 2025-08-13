import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/auth_cubit.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class VerificationemailScreen extends StatefulWidget {
  const VerificationemailScreen({super.key});

  @override
  State<VerificationemailScreen> createState() =>
      _VerificationemailScreenState();
}

class _VerificationemailScreenState extends State<VerificationemailScreen> {
  final TextEditingController pinController = TextEditingController();
  int seconds = 46;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted && seconds > 0) {
        setState(() {
          seconds--;
        });
        _startTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.h,
      textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey),
      ),
    );

    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is VerificationSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
           context.pushName(StringRoute.createnewPassword);
        } else if (state is VerificationFailure) {
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

          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Padding(
                  padding: EdgeInsets.only(top: 70.h),
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      Image.asset(
                        AssetManager.verificationemail,
                        height: 200.h,
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.only(left: 64.h, right: 42.h),
                        child: Text(
                          "Please enter the 4 digit code sent to: You@gmail.com",
                          style: AppStyles.congrate2Lines2Style,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Pinput(
                        controller: pinController,
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        onCompleted: (pin) {
                          context.read<UserCubit>().code.text = pin;
                        },
                      ),
                      SizedBox(height: 20.h),
                    state is VerificationLoading
                        ? const CircularProgressIndicator()
                        :   ElevatedButton(
                        onPressed: () {
                          context.read<UserCubit>().verification();
                       
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50.h),
                          backgroundColor: AppColors.darkblue100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          "Verify Code",
                          style: AppStyles.primaryHeadLinesStyle,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "00:${seconds.toString().padLeft(2, '0')}",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: seconds == 0
                            ? () {
                                setState(() {
                                  seconds = 46;
                                  _startTimer();
                                });
                              }
                            : null,
                        child: Text(
                          'Resend Code',
                          style: AppStyles.resetLines2Style,
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
