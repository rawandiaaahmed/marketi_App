import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/cart/data/model/cart_items_model.dart';
import 'package:flutter_application_1/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flutter_application_1/feature/home/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';

class cartDetailsScreen extends StatefulWidget {
  const cartDetailsScreen({Key? key, required this.cart})
    : super(key: key);

  final CartModel cart;

  @override
  State<cartDetailsScreen> createState() => _cartDetailsScreenState();
}

class _cartDetailsScreenState extends State<cartDetailsScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final cart = widget.cart;

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
            SizedBox(width: 55.w),
            Text("product Details", style: AppStyles.onboarderHeadLinesStyle),
            const Spacer(),
            const Icon(Icons.shopping_cart, color: AppColors.darkblue100),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Center(
              child: Image.network(
                cart.thumbnail.isNotEmpty
                    ? cart.thumbnail
                    : "https://via.placeholder.com/200",
                height: 200.h,
                width: 200.h,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                cart.images.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Image.network(
                    cart.images[index],
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.contain,
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
                    cart.shippingInformation,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Row(
                  children: [
                    ...List.generate(
                     cart.rating.floor(),
                      (index) => const Icon(Icons.star, color: AppColors.black),
                    ),
                    const Icon(
                      Icons.star_border,
                      color: AppColors.black,
                      size: 18,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "(${cart.rating.toStringAsFixed(1)})",
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
              cart.title,
              style: AppStyles.namehomeHeadLinesStyle.copyWith(fontSize: 18.sp),
            ),
            SizedBox(height: 8.h),

            Text(
              cart.description,
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
                  "Price\n\$${cart.price.toString()}",
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
                  onPressed: () {
               context.read<CartCubit>().addToCart(cart.id);

                  },
                  child: Row(
                    children: [
                      Image.asset(
                        AssetManager.cart,
                        color: AppColors.lightBlue100,
                      ),
                      SizedBox(width: 8.w),
                      Text("Add to Cart", style: AppStyles.producLines2Style),
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
