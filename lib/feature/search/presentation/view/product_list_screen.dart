import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';

import 'package:flutter_application_1/core/Router/route_string.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<bool> favorites = [];

  @override
  void initState() {
    super.initState();
    favorites = List.generate(3, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products = [
      {
        "title": "Pampers Swaddlers",
        "subtitle": "84 Diapers",
        "price": "345.00 EGP",
        "time": "Deliver in 60 mins",
        "rating": 4.9,
        "image": AssetManager.iphone,
      },
      {
        "title": "Seventh Generation",
        "subtitle": "152 Diapers",
        "price": "599.00 EGP",
        "time": "Deliver in 45 mins",
        "rating": 4.6,
        "image": AssetManager.iphone,
      },
      {
        "title": "Seventh Generation",
        "subtitle": "24 Diapers",
        "price": "88.00 EGP",
        "time": "Deliver in 45 mins",
        "rating": 4.5,
        "image": AssetManager.iphone,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     elevation: 0,
    //     backgroundColor: Colors.white,
    //     title: Row(
    //       children: [
    //         InkWell(onTap: () => Navigator.pop(context), child: Image.asset(AssetManager.back)),
    //         SizedBox(width: 80.w),
    //         Text("iphone", style: AppStyles.onboarderHeadLinesStyle),
    //         const Spacer(),
    //         Icon(Icons.shopping_cart, color: AppColors.darkblue100),
    //       ],
    //     ),
    //   ),
    //   body: Column(
    //     children: [
    //       Padding(padding: EdgeInsets.all(16.h), ),
    //       Expanded(
    //         child: ListView.separated(
    //           padding: EdgeInsets.all(16.w),
    //           itemCount: products.length,
    //           separatorBuilder: (context, index) => SizedBox(height: 12.h),
    //           itemBuilder: (context, index) {
    //             final product = products[index];
    //             return InkWell(
    //               onTap: () {
    //                context.pushName(
    //                   StringRoute.productDetails,
                     
    //                 );
    //               },
    //               child: Container(
    //                 width: double.infinity,
    //                 padding: EdgeInsets.all(10.w),
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.circular(12.r),
    //                   border: Border.all(color: Colors.grey.shade300),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.grey.shade200,
    //                       blurRadius: 5,
    //                       spreadRadius: 1,
    //                       offset: const Offset(0, 3),
    //                     ),
    //                   ],
    //                 ),
    //                 child: Row(
    //                   children: [
    //                     ClipRRect(
    //                       borderRadius: BorderRadius.circular(8.r),
    //                       child: Image.asset(
    //                         product["image"],
    //                         width: 107.w,
    //                         height: 108.w,
    //                         fit: BoxFit.cover,
    //                       ),
    //                     ),
    //                     SizedBox(width: 10.w),
    //                     Expanded(
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Expanded(
    //                                 child: Text(product["title"],
    //                                     style: AppStyles.onboarderLines2Style,
    //                                     overflow: TextOverflow.ellipsis),
    //                               ),
    //                               InkWell(
    //                                 onTap: () {
    //                                   setState(() {
    //                                     favorites[index] = !favorites[index];
    //                                   });
    //                                 },
    //                                 child: Icon(
    //                                   favorites[index] ? Icons.favorite : Icons.favorite_border,
    //                                   color: favorites[index] ? Colors.black : AppColors.darkblue900,
    //                                   size: 22.sp,
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           SizedBox(height: 4.h),
    //                           Text(product["subtitle"], style: AppStyles.detailsLines2Style),
    //                           SizedBox(height: 4.h),
    //                           Row(
    //                             children: [
    //                               Image.asset(AssetManager.time),
    //                               SizedBox(width: 2.w),
    //                               Text(product["time"], style: AppStyles.details2Lines2Style),
    //                             ],
    //                           ),
    //                           SizedBox(height: 6.h),
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Text("Price: ${product["price"]}", style: AppStyles.onboarderLines2Style),
    //                               Row(
    //                                 children: [
    //                                   Image.asset(AssetManager.rate),
    //                                   SizedBox(width: 4.w),
    //                                   Text('${product["rating"]}', style: AppStyles.detailsproductLines2Style),
    //                                 ],
    //                               ),
    //                             ],
    //                           ),
    //                           SizedBox(height: 8.h),
    //                           SizedBox(
    //                             width: double.infinity,
    //                             child: ElevatedButton(
    //                               onPressed: () {},
    //                               style: ElevatedButton.styleFrom(
    //                                 shape: RoundedRectangleBorder(
    //                                   borderRadius: BorderRadius.circular(14.r),
    //                                   side: BorderSide(color: AppColors.lightBlue100, width: 1.w),
    //                                 ),
    //                                 backgroundColor: AppColors.white,
    //                                 padding: EdgeInsets.symmetric(vertical: 10.h),
    //                               ),
    //                               child: Text("Add", style: AppStyles.producLines2Style),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
     );
  }
}