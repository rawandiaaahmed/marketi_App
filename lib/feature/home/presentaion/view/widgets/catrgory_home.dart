import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';

import 'package:flutter_application_1/core/extensions/extention_navigator.dart';

import 'package:flutter_application_1/feature/home/presentaion/view/widgets/category_card.dart';

import 'package:flutter_application_1/feature/home/presentaion/view/widgets/section_header.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/home_cubit.dart';

import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatrgoryHome extends StatelessWidget {
  const CatrgoryHome({super.key});
  

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
        return Column(
          children: [
            SectionHeader(
              title: "Category",
              onTap: () {
                context.pushName(StringRoute.category);
              },
            ),
            SizedBox(height: 8.h),
            if (state is GetCategoryLoading)
              const Center(child: CircularProgressIndicator()),

            if (state is GetCategorySuccess) ...[
              SizedBox(
                height: 300.h,
                child: GridView.builder(
                  shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  itemCount: state.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2
                  ),
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return CategoryCard(category: category);
                  },
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
