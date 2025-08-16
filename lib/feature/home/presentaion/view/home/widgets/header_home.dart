import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(AssetManager.homeimage),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Hi Yousef !",
                        style: AppStyles.namehomeHeadLinesStyle,
                      ),
                      const Spacer(),
                      const Icon(Icons.notifications_outlined, size: 28),
                    ],
                  );
  }
}