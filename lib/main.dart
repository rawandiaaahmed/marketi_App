import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/helper/cache_helper.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: StringRoute.splash, 
          onGenerateRoute: AppRoutes.onGenerateRoute, 
        );
      },
    );
  }
}