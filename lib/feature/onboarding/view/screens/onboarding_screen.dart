import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/onboarding/view/widgets/onboarding_widget.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(),
    );
  }
}
