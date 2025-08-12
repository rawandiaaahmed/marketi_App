import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GlobalKey<FormState> formKey;
  final VoidCallback? onValid;

const  CustomButton({
    super.key,
    required this.text,
    required this.formKey,
    this.onValid,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(left: 10.h, right: 10.h),
        backgroundColor: AppColors.darkblue100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      onPressed: () {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          if (onValid != null) onValid!();
        }
      },
      child: Text(text, style: AppStyles.primaryHeadLinesStyle),
    );
  }
}