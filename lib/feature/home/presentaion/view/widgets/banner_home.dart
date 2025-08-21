import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerHome extends StatelessWidget {
  BannerHome({super.key});

  final List<String> bannerImages = [
    AssetManager.homeprofile,
    AssetManager.banner1,
    AssetManager.banner2,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 120.h,
        autoPlay: true, 
        enlargeCenterPage: true, 
        viewportFraction: 0.9, 
        aspectRatio: 16/9,
        autoPlayInterval: const Duration(seconds: 3), 
      ),
      items: bannerImages.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.blue.shade700,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}