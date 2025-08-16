import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/category_card.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/section_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatrgoryHome extends StatelessWidget {
  const CatrgoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          SectionHeader(title: "Category",onTap: () {
           
         },),
                  SizedBox(height: 8.h),
                  GridView.count(
  crossAxisCount: 3, 
  shrinkWrap: true,  
  physics: const NeverScrollableScrollPhysics(), 
  childAspectRatio: 0.9, 
  children: [
    CategoryCard(title: "Pampers", image: AssetManager.iphone),
    CategoryCard(title: "Electronics", image: AssetManager.iphone),
    CategoryCard(title: "Plants", image: AssetManager.iphone),
    CategoryCard(title: "Phones", image: AssetManager.iphone),
    CategoryCard(title: "Food", image: AssetManager.iphone),
    CategoryCard(title: "Fashion", image: AssetManager.iphone),
  ],
),
      ],
    );
  }
}