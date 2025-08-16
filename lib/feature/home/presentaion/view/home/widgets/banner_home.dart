import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    width: double.infinity,
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.blue.shade700,
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(AssetManager.homeprofile),
                  );
  }
}