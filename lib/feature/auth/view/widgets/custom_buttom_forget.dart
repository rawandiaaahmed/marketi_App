// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';


class CustomButtomForget extends StatelessWidget {
  CustomButtomForget({
    Key? key,
    required this.text,
    required this.formKey,
    this.onValid,
  }) : super(key: key);
    final String text;
  final GlobalKey<FormState> formKey;
  final VoidCallback? onValid;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState != null && formKey.currentState!.validate()) {
          if (onValid != null) onValid!();
        
                       
                          
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50.h),
                        backgroundColor: AppColors.darkblue100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        text,
                        style: AppStyles.primaryHeadLinesStyle,
                      ),
                    );
  }
}
