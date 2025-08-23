import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view_model/cubit/favorite_state.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/search_home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
  
    context.read<FavoriteCubit>().favorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Text("Favorites", style: AppStyles.namehomeHeadLinesStyle),
            
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchHome(onTap: () {}),
            SizedBox(height: 10.h),
            Text("All products", style: AppStyles.onboarderHeadLinesStyle),
            SizedBox(height: 10.h),
            Expanded(
              child: BlocConsumer<FavoriteCubit, FavoriteState>(
                listener: (context, state) {
                  if (state is AddFavoriteSuccess || state is DeleteFavoriteSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state is AddFavoriteSuccess
                              ? state.message
                              : (state as DeleteFavoriteSuccess).message,
                        ),
                      ),
                    );
                    context.read<FavoriteCubit>().favorite();
                  } else if (state is AddFavoriteFailure || state is DeleteFavoriteFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state is AddFavoriteFailure
                              ? state.errMessage
                              : (state as DeleteFavoriteFailure).errMessage,
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is FavoriteLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FavoriteFailure) {
                    return Center(child: Text(state.errMessage));
                  } else if (state is FavoriteSuccess) {
                    final favoriteItems = state.favoritemodel;
                    if (favoriteItems.isEmpty) {
                      return const Center(child: Text("No favorites yet!"));
                    }
                    return GridView.builder(
                      itemCount: favoriteItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 5.w,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        final product = favoriteItems[index];
                        bool isFavorite = true;

                        return Container(
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
                                    Padding(
                                      padding: EdgeInsets.all(8.h),
                                      child: Container(
                                        height: 96.h,
                                        width: 167.w,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(5.r),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5.r),
                                          child: Image.network(
                                            product.thumbnail,
                                            width: double.infinity,
                                            height: 120.h,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Center(child: Icon(Icons.error));
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8.h,
                                      right: 8.w,
                                      child: GestureDetector(
                                        onTap: () {
                                          context.read<FavoriteCubit>().deleteFavorite(product.id);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
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
                                          child: Padding(
                                            padding: EdgeInsets.all(4.w),
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 20.sp,
                                            ),
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
                                        Text(
                                          "${product.price} EGP",
                                          style: AppStyles.detailsproductLines2Style,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(AssetManager.rate),
                                            SizedBox(width: 4.w),
                                            Text("${product.rating}", style: AppStyles.detailsproductLines2Style),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      product.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.detailsproductLines2Style,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.pushName(
                                    StringRoute.productDetails,
                                    arguments: product,
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 8.h),
                                  child: Container(
                                    height: 30.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14.r),
                                      border: Border.all(color: Colors.lightBlue.shade100),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "View",
                                        style: AppStyles.producLines2Style,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}