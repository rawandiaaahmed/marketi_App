import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/search_home.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(AssetManager.back),
            ),

            CircleAvatar(
              radius: 18.r,
              backgroundImage: const NetworkImage(
                "https://i.pravatar.cc/150?img=3",
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchHome(
                onTap: () {
                  context.pushName(StringRoute.productlist);
                },
              ),
              SizedBox(height: 20.h),
              Text("Popular Search", style: AppStyles.onboarderHeadLinesStyle),
              SizedBox(height: 10.h),
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children:
                    [
                          "Pampers",
                          "Toothpaste",
                          "iPhone",
                          "Pants",
                          "Laptop",
                          "Fried Chicken",
                          "Sugar",
                          "Smart TV",
                          "Xbox",
                        ]
                        .map(
                          
                          (e) => Chip(
                           
                            label: Text(e),
                            backgroundColor: AppColors.lightBlue900,
                          ),
                        )
                        .toList(),
              ),
              SizedBox(height: 20.h),
              Text("Search History", style: AppStyles.onboarderHeadLinesStyle),
              SizedBox(height: 10.h),
              Column(
                children:
                    [
                          "iPhone XS Max",
                          "Laptop Lenovo ideapad 3",
                          "White Sweet Pants",
                        ]
                        .map(
                          (e) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              e,
                              style: AppStyles.onboarderHeadLinesStyle.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.close,
                              color: Colors.grey,
                            ),
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
