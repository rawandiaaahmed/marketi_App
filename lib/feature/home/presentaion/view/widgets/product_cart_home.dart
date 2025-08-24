import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home/data/model/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';

class ProductCardHome extends StatefulWidget {
   ProductCardHome({
    Key? key,
    required this.product,
    required this.onTap,
    required this.onAddToCart,
    required this.isFavorite,
    required this.onToggleFavorite,
  }) : super(key: key);

  final ProductModel product;
  final VoidCallback onTap;
  final VoidCallback onAddToCart;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  @override
  State<ProductCardHome> createState() => _ProductCardHomeState();
}

class _ProductCardHomeState extends State<ProductCardHome> {
  bool _isPressedAdd = false;
  bool _isPressedFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 164.w,
        height: 200.h,
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                    child: Image.network(
                      widget.product.thumbnail,
                      width: double.infinity,
                      height: 120.h,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: GestureDetector(
                      onTapDown: (_) => setState(() => _isPressedFav = true),
                      onTapUp: (_) => setState(() => _isPressedFav = false),
                      onTapCancel: () => setState(() => _isPressedFav = false),
                      onTap: widget.onToggleFavorite,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        transform: Matrix4.identity()
                          ..scale(_isPressedFav ? 0.85 : 1.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(4.w),
                        child: Icon(
                          widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: widget.isFavorite ? Colors.red : AppColors.darkblue900,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${widget.product.price}', style: AppStyles.detailsproductLines2Style),
                      Row(
                        children: [
                          Image.asset(AssetManager.rate),
                          SizedBox(width: 4.w),
                          Text(widget.product.rating.toString(), style: AppStyles.detailsproductLines2Style),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    widget.product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.detailsproductLines2Style,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTapDown: (_) => setState(() => _isPressedAdd = true),
              onTapUp: (_) => setState(() => _isPressedAdd = false),
              onTapCancel: () => setState(() => _isPressedAdd = false),
              onTap: widget.onAddToCart,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 8.h),
                height: 30.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _isPressedAdd ? AppColors.lightBlue100 : AppColors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: AppColors.lightBlue100),
                ),
                child: Center(
                  child: Text(
                    "Add",
                    style: AppStyles.producLines2Style,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}