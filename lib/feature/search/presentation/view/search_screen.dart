import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/widget/louding_cubit.dart';
import 'package:flutter_application_1/feature/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:flutter_application_1/feature/search/presentation/view/widgets/search_result_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  final List<bool> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(AssetManager.back),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // 🔎 صندوق البحث
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "What are you looking for?",
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        context.read<SearchCubit>().search(value);
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // 🖼️ النتائج
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return ProductLoadingWidget();
                  } else if (state is Searchsuccess) {
                    if (favorites.length < state.search.length) {
                      favorites.addAll(
                        List.filled(
                          state.search.length - favorites.length,
                          false,
                        ),
                      );
                    }
                    return GridView.builder(
                      itemCount: state.search.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 5.w,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        final product = state.search[index];
                        return SearchResultItem(
                          product: product,
                          isFavorite: favorites[index],
                          onFavoriteToggle: () {
                            favorites[index] = !favorites[index];
                          },
                        );
                      },
                    );
                  } else if (state is SearchFailuer) {
                    return Center(child: Text("Error: ${state.errMessage}"));
                  }
                  return Center(child: Text("Type something to search"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
