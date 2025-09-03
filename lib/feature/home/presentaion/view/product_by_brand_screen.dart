import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/core/widget/louding_cubit.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/product_by_brand_item.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductByBrandScreen extends StatelessWidget {
  final String brand;
  const ProductByBrandScreen({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().getProductbyBrand(brand: brand);

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
            SizedBox(width: 84.w),
            Text(AppStrings.brands, style: AppStyles.namehomeHeadLinesStyle),
            const Spacer(),
          ],
        ),
      ),
      body: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetProductbyBrandFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetProductbyBrandLoading) {
              return ProductLoadingWidget();
            } else if (state is GetProductbyBrandSuccess) {
              return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent) {
                    context.read<HomeCubit>().getProductbyBrand(
                      isLoadMore: true,
                      brand: brand,
                    );
                  }
                  return true;
                },
                child: GridView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: state.productBrand.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 1.4,
                  ),
                  itemBuilder: (context, index) {
                    final product = state.productBrand[index];
                    return ProductByBrandItem(product: product);
                  },
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
