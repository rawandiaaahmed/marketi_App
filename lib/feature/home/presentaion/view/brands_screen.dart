import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/category_card.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/search_home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsScreen extends StatelessWidget {
   BrandsScreen({super.key});
   final List<Map<String, String>> products = [
    {
      "image": AssetManager.iphone,
      "title": "Sony Headphone",
      
    },
    {
       "image": AssetManager.iphone,
      "title": "Sony Headphone",
    },
    {
      "image": AssetManager.iphone,
      "title": "Samsung TV",
     
    },
    {
      "image": AssetManager.iphone,
      "title": "Smart Watch",
      
    },
     {
      "image": AssetManager.iphone,
      "title": "Smart Watch",

    },
     {
      "image": AssetManager.iphone,
      "title": "Smart Watch",
     
    },
     {
      "image": AssetManager.iphone,
      "title": "Smart Watch",
      
    },
     {
      "image": AssetManager.iphone,
      "title": "Smart Watch",

    },
     {
      "image": AssetManager.iphone,
      "title": "Smart Watch",
     
    },
     {
      "image": AssetManager.iphone,
      "title": "Smart Watch",
      
    },
     {
      "image": AssetManager.iphone,
      "title": "Smart Watch",

    },
     {
      "image": AssetManager.iphone,
      "title": "Smart Watch",
     
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(AssetManager.back),
            ),
            SizedBox(width: 90.w),
            Text(AppStrings.brands, style: AppStyles.namehomeHeadLinesStyle),
            const Spacer(),
           CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(AssetManager.homeimage),
                      ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchHome(onTap: () {}),
            SizedBox(height: 10.h),
            Text(AppStrings.brand, style: AppStyles.onboarderHeadLinesStyle),
            SizedBox(height: 10.h),

        
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  mainAxisSpacing: 10.h, 
                  crossAxisSpacing: 20.w,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return CategoryCard(
                    image: product["image"]!,
                    title: product["title"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}