import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/section_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsHome extends StatelessWidget {
  const BrandsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
         SectionHeader(title: "Brands",onTap: () {
          context.pushName(StringRoute.brands);
           
         },),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(AssetManager.iphone, height: 50.h),
                      Image.asset(AssetManager.iphone, height: 50.h),
                      Image.asset(AssetManager.iphone, height: 50.h),
                      Image.asset(AssetManager.iphone, height: 50.h),
                      Image.asset(AssetManager.iphone, height: 50.h),
                      Image.asset(AssetManager.iphone, height: 50.h),
                    ],
                  ),],
    );
  }
}