import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/Search_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/product_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyAgainScreen extends StatelessWidget {
  BuyAgainScreen({super.key});
   final List<Map<String, String>> products = [
    {
      "image": AssetManager.iphone,
      "name": "Sony Headphone",
      "price": "3499 LE",
      "rate": "4.0",
    },
    {
      "image": AssetManager.iphone,
      "name": "iPhone 14",
      "price": "22000 LE",
      "rate": "4.5",
    },
    {
      "image": AssetManager.iphone,
      "name": "Samsung TV",
      "price": "9999 LE",
      "rate": "4.3",
    },
    {
      "image": AssetManager.iphone,
      "name": "Smart Watch",
      "price": "1999 LE",
      "rate": "4.2",
    },
     {
      "image": AssetManager.iphone,
      "name": "Smart Watch",
      "price": "1999 LE",
      "rate": "4.2",
    },
     {
      "image": AssetManager.iphone,
      "name": "Smart Watch",
      "price": "1999 LE",
      "rate": "4.2",
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
            SizedBox(width: 50.w),
            Text("Buy Again", style: AppStyles.namehomeHeadLinesStyle),
            const Spacer(),
            Icon(Icons.shopping_cart, color: AppColors.darkblue100),
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
            Text("All products", style: AppStyles.onboarderHeadLinesStyle),
            SizedBox(height: 10.h),

        
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  mainAxisSpacing: 10.h, 
                  crossAxisSpacing: 5.w,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    image: product["image"]!,
                    price: product["price"]!,
                    name: product["name"]!,
                    rate: product["rate"]!,
                    onTap: () {},
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