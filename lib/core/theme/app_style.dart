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
    fontFamily: AppFonts.mainFontName,
  );
  static TextStyle onboarderHeadLinesStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
    color: AppColors.darkblue900,
    fontFamily: AppFonts.mainFontName,
  );
    static TextStyle onboarderLines2Style = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    color: AppColors.darkblue900,
    fontFamily: AppFonts.mainFontName,
  );
  static TextStyle congrateLines2Style = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24.sp,
    color: AppColors.darkblue900,
    fontFamily: AppFonts.mainFontName,
  );
  static TextStyle congrate2Lines2Style = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.mediumGrey,
    fontFamily: AppFonts.mainFontName,
  );
  static TextStyle try2Lines2Style = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
   color: AppColors.primaryColor,
    fontFamily: AppFonts.mainFontName,
  );
  static TextStyle resetLines2Style = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
   color: AppColors.mediumGrey,
    fontFamily: AppFonts.mainFontName,
  );

}
