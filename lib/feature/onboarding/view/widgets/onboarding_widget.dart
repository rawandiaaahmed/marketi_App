import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  final List<Map<String, String>> onboardingData = [
    {
      "image": AssetManager.onboarding1,
      "title": AssetManager.onboardingTitle1,
      "description": AssetManager.onboardingSubTitle1,
    },
    {
      "image": AssetManager.onboarding2,
      "title": AssetManager.onboardingTitle2,
      "description": AssetManager.onboardingSubTitle2,
    },
    {
      "image": AssetManager.onboarding3,
      "title": AssetManager.onboardingTitle3,
      "description": AssetManager.onboardingSubTitle3,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: onboardingData.length,
      onPageChanged: (index) {
        setState(() {
          isLastPage = index == onboardingData.length - 1;
        });
      },
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 160.h, bottom: 45.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Image.asset(
                onboardingData[index]["image"]!,
                width: 344.w,
                height: 256.h,
              ),
              SizedBox(height: 29.h),
              SmoothPageIndicator(
                controller: _controller,
                count: onboardingData.length,
                effect: WormEffect(
                  dotHeight: 17.h,
                  dotWidth: 17.w,
                  spacing: 7.w,
                  activeDotColor: AppColors.darkblue900,
                  dotColor: AppColors.lightBlue700,
                ),
              ),
              SizedBox(height: 25.h),
              Image.asset(onboardingData[index]["title"]!),

              SizedBox(height: 35.h),
              Image.asset(onboardingData[index]["description"]!),
              const Spacer(flex: 3),
              SizedBox(
                width: 350.w,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 10.h, right: 10.h),
                    backgroundColor: AppColors.darkblue100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: () {
                    if (isLastPage) {
                         context.pushName(StringRoute.signin);
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    isLastPage ? "Get Start" : "Next",
                    style: AppStyles.primaryHeadLinesStyle,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
