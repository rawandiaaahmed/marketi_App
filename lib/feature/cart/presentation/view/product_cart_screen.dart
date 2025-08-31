import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/app_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/cart/presentation/view/widget/cart_item_widget.dart';

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

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(16.w),
                    itemCount: cartItems.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final product = cartItems[index];

                      return CartItemWidget(
                        product: product,
                        onTap: () {
                          context.pushName(
                            StringRoute.detalscart,
                            arguments: product,
                          );
                        },
                        onDelete: () {
                          context.read<CartCubit>().deleteFromCart(product.id);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
