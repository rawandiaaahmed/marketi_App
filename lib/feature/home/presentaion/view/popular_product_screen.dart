import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';

import 'package:flutter_application_1/core/theme/app_style.dart';

import 'package:flutter_application_1/feature/home/presentaion/view/widgets/product_card.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/search_home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularProductScreen extends StatefulWidget {
  const PopularProductScreen({super.key});

  @override
  State<PopularProductScreen> createState() => _PopularProductScreenState();
}

class _PopularProductScreenState extends State<PopularProductScreen> {
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
            Text("Popular Product", style: AppStyles.namehomeHeadLinesStyle),
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