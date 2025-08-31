import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';

import 'package:flutter_application_1/feature/favorite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view_model/cubit/favorite_state.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view/widgets/favorite_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            SizedBox(height: 10.h),
            Text("All Favorites", style: AppStyles.onboarderHeadLinesStyle),
            SizedBox(height: 10.h),
            Expanded(
              child: BlocConsumer<FavoriteCubit, FavoriteState>(
                listener: (context, state) {
                  if (state is AddFavoriteSuccess ||
                      state is DeleteFavoriteSuccess) {
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
                  } else if (state is AddFavoriteFailure ||
                      state is DeleteFavoriteFailure) {
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
                        return FavoriteItem(product: product);
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
