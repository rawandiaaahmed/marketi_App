import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? label;

  final Widget? suffixIcon;
   final Widget? prefixIcon;
  final double? width;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final Function()? onTap;
  
  const CustomTextField(
      {super.key,
      this.hintText,
      this.readOnly,
      this.onTap ,
      this.suffixIcon,
      this.width,
      this.isPassword,
      this.controller,
      this.prefixIcon,
    this.label,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 331.w,
        child: TextFormField(
            controller: controller,
            validator: validator,
            autofocus: false,
            obscureText: isPassword ?? false,
            readOnly: readOnly ?? false,
            
            
           
            onTap: onTap,
            decoration: InputDecoration(
              
              hintText: hintText ?? "",
              hintStyle: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xff8391A1),
                  fontWeight: FontWeight.w500),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 1)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: const BorderSide(color: Colors.red, width: 1)),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              filled: false,
              fillColor: const Color(0xffF7F8F9),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              label: label,
          
              
              
              
              
            )));
  }
}