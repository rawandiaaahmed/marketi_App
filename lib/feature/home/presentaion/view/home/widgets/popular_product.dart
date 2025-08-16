import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart' show StringRoute;
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/product_card.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/section_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: "Popular Product",
          onTap: () {
           context.pushName(StringRoute.popularProduct);
          },
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 180.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ProductCard(
                image: AssetManager.iphone,
                name: "iPhone 11 Pro",
                price: "19999 LE",
                rate: "4.5",
                onTap: () {
                  
                },
              ),
              ProductCard(
                image: AssetManager.iphone,
                name: "Smart Watch",
                price: "499 LE",
                rate: "4.0",
                onTap: () {
                  
                },
              ),
              ProductCard(
                image: AssetManager.iphone,
                name: "iPhone 11 Pro",
                price: "19999 LE",
                rate: "4.5",
                onTap: () {
                  
                },
              ),
              ProductCard(
                image: AssetManager.iphone,
                name: "Smart Watch",
                price: "499 LE",
                rate: "4.0",
                onTap: () {
                  
                },
              ),
              ProductCard(
                image: AssetManager.iphone,
                name: "iPhone 11 Pro",
                price: "19999 LE",
                rate: "4.5",
                onTap:() {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}