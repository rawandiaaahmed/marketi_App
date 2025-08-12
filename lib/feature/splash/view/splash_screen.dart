import 'package:flutter/material.dart';

import 'package:flutter_application_1/feature/splash/view/widgets/splash_time.dart';




class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SplashTime(),
    );
  }
}