import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle primaryHeadLinesStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
   static TextStyle signupHeadLinesStyle = TextStyle(
   color: AppColors.darkblue900,
   fontSize: 12.sp,
   fontFamily: AppFonts.mainFontName
  );
}
