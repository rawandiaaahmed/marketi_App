import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCartScreen extends StatefulWidget {
  const ProductCartScreen({super.key});

  @override
  State<ProductCartScreen> createState() => _ProductCartScreenState();
}

class _ProductCartScreenState extends State<ProductCartScreen> {
  List<bool> favorites = [];
  List<int> quantities = [];

  final List<Map<String, dynamic>> products = [
    {
      "title": "Pampers Swaddlers",
      "subtitle": "84 Diapers",
      "price": 345.00,
      "time": "Deliver in 60 mins",
      "rating": 4.9,
      "image": AssetManager.iphone,
    },
    {
      "title": "Seventh Generation",
      "subtitle": "152 Diapers",
      "price": 599.00,
      "time": "Deliver in 45 mins",
      "rating": 4.6,
      "image": AssetManager.iphone,
    },
    {
      "title": "Seventh Generation",
      "subtitle": "24 Diapers",
      "price": 88.00,
      "time": "Deliver in 45 mins",
      "rating": 4.5,
      "image": AssetManager.iphone,
    },
  ];

  @override
  void initState() {
    super.initState();
    favorites = List.generate(products.length, (index) => false);
    quantities = List.generate(products.length, (index) => 0);
  }

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (int i = 0; i < products.length; i++) {
      total += products[i]["price"] * quantities[i];
    }

    
    int totalItems = quantities.fold(0, (sum, item) => sum + item);

    return Scaffold(
      backgroundColor: AppColors.white,
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
            SizedBox(width: 100.w),
            Text(AppStrings.cart4, style: AppStyles.namehomeHeadLinesStyle),
            const Spacer(),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(AssetManager.homeimage),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(16.w),
              itemCount: products.length,
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      /// صورة المنتج
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          product["image"],
                          width: 107.w,
                          height: 108.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.w),

                      /// تفاصيل المنتج
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// اسم المنتج + المفضلة
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    product["title"],
                                    style: AppStyles.onboarderLines2Style,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      favorites[index] = !favorites[index];
                                    });
                                  },
                                  child: Icon(
                                    favorites[index]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: favorites[index]
                                        ? Colors.black
                                        : AppColors.darkblue900,
                                    size: 22.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),

                            /// الوصف
                            Text(
                              product["subtitle"],
                              style: AppStyles.detailsLines2Style,
                            ),
                            SizedBox(height: 4.h),

                            /// وقت التوصيل
                            Row(
                              children: [
                                Image.asset(AssetManager.time),
                                SizedBox(width: 2.w),
                                Text(
                                  product["time"],
                                  style: AppStyles.details2Lines2Style,
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),

                            /// السعر + التقييم + الكمية
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// السعر + التقييم
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Price: ${product["price"]} EGP",
                                      style: AppStyles.onboarderLines2Style,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(AssetManager.rate),
                                        SizedBox(width: 4.w),
                                        Text(
                                          '${product["rating"]}',
                                          style: AppStyles
                                              .detailsproductLines2Style,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),

                                /// أزرار التحكم في الكمية
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _quantityButton(
                                      icon: Icons.remove,
                                      onTap: () {
                                        if (quantities[index] > 0) {
                                          setState(() {
                                            quantities[index]--;
                                          });
                                        }
                                      },
                                    ),
                                    SizedBox(width: 12.w),
                                    _quantityBox(quantities[index]),
                                    SizedBox(width: 12.w),
                                    _quantityButton(
                                      icon: Icons.add,
                                      onTap: () {
                                        setState(() {
                                          quantities[index]++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton({required IconData icon, required VoidCallback onTap}) {
    return Container(
      width: 40.w,
      height: 41.h,
      decoration: BoxDecoration(
        color: AppColors.lightBlue900,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.lightBlue900),
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(icon, color: AppColors.lightBlue100, size: 24.sp),
      ),
    );
  }

  /// صندوق الكمية
  Widget _quantityBox(int value) {
    return Container(
      width: 100.w,
      height: 41.h,
      decoration: BoxDecoration(
        color: AppColors.lightIce,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.lightIce),
      ),
      child: Center(
        child: Text(
          "$value",
          style: AppStyles.producLines2Style.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}