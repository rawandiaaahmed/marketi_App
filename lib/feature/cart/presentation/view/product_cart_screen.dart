import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/app_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCartScreen extends StatefulWidget {
  const ProductCartScreen({super.key});

  @override
  State<ProductCartScreen> createState() => _ProductCartScreenState();
}

class _ProductCartScreenState extends State<ProductCartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getUsercart();
  }

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartFailure ||
              state is AddCartFailure ||
              state is DeleteCartFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state is CartFailure
                      ? state.errMessage
                      : state is AddCartFailure
                      ? state.errMessage
                      : (state as DeleteCartFailure).errMessage,
                ),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AddCartSuccess || state is DeleteCartSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state is AddCartSuccess
                      ? state.message
                      : (state as DeleteCartSuccess).message,
                ),
                backgroundColor: Colors.green,
              ),
            );
            context.read<CartCubit>().getUsercart();
          }
        },
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartFailure) {
            return const Center(child: Text("Failed to load cart"));
          } else if (state is CartSuccess) {
            final cartItems = state.cartmodel;

            return InkWell(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.all(16.w),
                      itemCount: cartItems.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final product = cartItems[index];

                        final discountedPrice =
                            (product.price -
                                    (product.price *
                                        (product.discountPercentage / 100)))
                                .toStringAsFixed(2);

                        return InkWell(
                          onTap: () {
                            context.pushName(StringRoute.detalscart,arguments: product);
                          },
                          child: Container(
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
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.network(
                                    product.thumbnail,
                                    width: 107.w,
                                    height: 108.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10.w),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              product.title,
                                              style: AppStyles
                                                  .onboarderLines2Style,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              context
                                                  .read<CartCubit>()
                                                  .deleteFromCart(product.id);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 1.h,
                                                horizontal: 2.w,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red.shade400,
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.red.shade200,
                                                    blurRadius: 4,
                                                    offset: const Offset(0, 2),
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4.h),

                                      Text(
                                        product.description,
                                        style: AppStyles.detailsLines2Style,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4.h),

                                      Row(
                                        children: [
                                          Text(
                                            '\$$discountedPrice',
                                            style: AppStyles
                                                .detailsproductLines2Style,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            '\$${product.price}',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            '-${product.discountPercentage}%',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: AppColors.lightBlue700,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Spacer(),
                                          Image.asset(AssetManager.rate),
                                          SizedBox(width: 4.w),
                                          Text(
                                            '${product.rating}',
                                            style: AppStyles
                                                .detailsproductLines2Style,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
