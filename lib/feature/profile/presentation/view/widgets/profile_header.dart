import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  final dynamic profile; // استبدليها بموديل البروفايل الحقيقي
  final bool isDarkMode;
  final VoidCallback onPickImage;

  const ProfileHeader({
    super.key,
    required this.profile,
    required this.isDarkMode,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundImage: profile.image.isNotEmpty
                    ? NetworkImage(profile.image)
                    : const AssetImage("assets/images/placeholder.png")
                          as ImageProvider,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: onPickImage,
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: AppColors.lightBlue100,
                    child: Icon(Icons.add, color: Colors.white, size: 18.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          profile.name,
          style: AppStyles.onboarderHeadLinesStyle.copyWith(
            fontSize: 18.sp,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        Text(
          profile.email,
          style: AppStyles.details2Lines2Style.copyWith(
            fontSize: 14.sp,
            color: isDarkMode ? Colors.white70 : Colors.black54,
          ),
        ),
      ],
    );
  }
}
