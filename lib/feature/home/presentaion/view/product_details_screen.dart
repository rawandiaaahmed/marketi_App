import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isExpanded = false;

  final Map<String, dynamic> product = {
    "name": "iPhone 15 Pro",
    "price": "345.00 EGP",
    "image": AssetManager.iphone,
    "sizes": ["2", "3", "4"],
    "description":
        "Fear no leaks with new and improved Pampers Swaddlers Pampers Swaddlers helps prevent up to 100% of leaks, even blowouts Plus, Dual Leak-Guard Barriers at the legs help protect where leaks happen most With Swaddlers, you can rest assured that you have superior leak protection while keeping baby's skin healthy.",
  };

  @override
  Widget build(BuildContext context) {
    List<String> sizes = List<String>.from(product["sizes"] ?? ["2", "3", "4"]);

    return Scaffold(
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
            SizedBox(width: 80.w),
            Text("iphone", style: AppStyles.onboarderHeadLinesStyle),
            const Spacer(),
            Icon(Icons.shopping_cart, color: AppColors.darkblue100),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product["image"] ?? "assets/images/pampers.png",
                height: 200.h,
                width: 200.h,
              ),
            ),
            SizedBox(height: 10.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Image.asset(
                    product["image"] ?? "assets/images/pampers.png",
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "Free Shipping",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.black),
                    const Icon(Icons.star, color: AppColors.black),
                    const Icon(Icons.star, color: AppColors.black),
                    const Icon(Icons.star, color: AppColors.black),
                    const Icon(
                      Icons.star_border,
                      color: AppColors.black,
                      size: 18,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "(4.0)",
                      style: AppStyles.descriptionHeadLinesStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),

            Text(
              "${product["name"] ?? "345.00 EGP"}",
              style: AppStyles.namehomeHeadLinesStyle.copyWith(fontSize: 18.sp),
            ),
            SizedBox(height: 8.h),

            Text(
              product["description"] ?? "",
              maxLines: isExpanded ? null : 2,
              overflow: isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              style: AppStyles.descriptionHeadLinesStyle,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? "See less" : "See more",
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price\n${product["price"] ?? "345.00 EGP"}",
                  style: AppStyles.namehomeHeadLinesStyle.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 50.w,
                      vertical: 14.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset(
                        AssetManager.cart,
                       color: AppColors.lightBlue100,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Add to Cart",
                        style: AppStyles.producLines2Style,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
