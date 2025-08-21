import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/category_card.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/widgets/search_home.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/product_by_category_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetCategorySuccess ||
          current is GetCategoryLoading ||
          current is GetCategoryFailure,
      listener: (context, state) {
        if (state is GetCategoryFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
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
                SizedBox(width: 70.w),
                Text(AppStrings.category,
                    style: AppStyles.namehomeHeadLinesStyle),
                const Spacer(),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(AssetManager.homeimage),
                ),
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
                  Text(AppStrings.categories,
                      style: AppStyles.onboarderHeadLinesStyle),
                  SizedBox(height: 10.h),
                  if (state is GetCategoryLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (state is GetCategorySuccess) ...[
                    Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification notification) {
                          if (notification.metrics.pixels >=
                              notification.metrics.maxScrollExtent) {
                            context
                                .read<HomeCubit>()
                                .getCategories(isLoadMore: true);
                          }
                          return true;
                        },
                        child: GridView.builder(
                          itemCount: state.categories.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 20.w,
                            childAspectRatio: 1.4,
                          ),
                          itemBuilder: (context, index) {
                            final category = state.categories[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProductByCategoryScreen(
                                      category: category.name,
                                    ),
                                  ),
                                );
                              },
                              child: CategoryCard(category: category),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ]),
          ),
        );
      },
    );
  }
}