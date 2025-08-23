import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
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
  List<bool> favorites = [];
  List<int> quantities = [];

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
            const Spacer(),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(AssetManager.homeimage),
            ),
          ],
        ),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
               
              ),
            );
          } else if (state is CartSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("success✅"),
               
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartFailure) {
  
            return const Center(child: Text("false"));
          } else if (state is CartSuccess) {
            final cartItems = state.cartmodel;

            if (favorites.isEmpty) {
              favorites = List.generate(cartItems.length, (index) => false);
              quantities = List.generate(cartItems.length, (index) => 0);
            }

            double total = 0;
            for (int i = 0; i < cartItems.length; i++) {
              total += cartItems[i].price * quantities[i];
            }

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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                          
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          product.title,
                                          style: AppStyles.onboarderLines2Style,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            favorites[index] =
                                                !favorites[index];
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

                  
                                  Text(
                                    product.description,
                                    style: AppStyles.detailsLines2Style,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.h),

                      
                                  Row(
                                    children: [
                                      Image.asset(AssetManager.time),
                                      SizedBox(width: 2.w),
                                      Text(
                                        "Deliver in 60 mins",
                                        style: AppStyles.details2Lines2Style,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6.h),

                  
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                      
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Price: ${product.price} EGP",
                                            style:
                                                AppStyles.onboarderLines2Style,
                                          ),
                                          Row(
                                            children: [
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
                                      SizedBox(height: 8.h),

                      
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
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
