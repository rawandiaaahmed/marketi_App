import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';

import 'package:flutter_application_1/feature/onboarding/view/screens/onboarding_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashTime extends StatefulWidget {
  const SplashTime({super.key});

  @override
  State<SplashTime> createState() => _SplashTimeState();
}

class _SplashTimeState extends State<SplashTime> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetManager.splash, width: 300.w, height: 256.h),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
