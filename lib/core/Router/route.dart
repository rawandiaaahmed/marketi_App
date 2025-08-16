import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/bottom_bar.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/forget_password/congrate_screen.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/forget_password/create_new_password.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/forget_password/forget_password_screen.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/forget_password/forgot_password_email_screen.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/forget_password/verification_code_screen.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/forget_password/verification_email_screen.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/login/sign_in_screen.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/sign_up/sign_up_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/best_for_you_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/buy_again_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/favorite_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/popular_product_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/product_list_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/home_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/search_screen.dart';
import 'package:flutter_application_1/feature/onboarding/view/onboarding_screen.dart';
import 'package:flutter_application_1/feature/splash/view/splash_screen.dart';



import 'base_routes.dart';
import 'route_string.dart';

class AppRoutes {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    //   final args = settings.arguments;
    switch (settings.name) {
      case StringRoute.onBoarding:
        return BaseRoute(
          page: const OnboardingScreen(),
          transitionType: RouteTransitionType.fade,
        );
        
         case StringRoute.splash:
        return BaseRoute(
          page: const SplashScreen(),
          transitionType: RouteTransitionType.fade,
        );
         case StringRoute.signin:
        return BaseRoute(
          page:  SignInScreen(),
          transitionType: RouteTransitionType.fade,
        );
         case StringRoute.signUp:
        return BaseRoute(
          page:  SignUpScreen(),
          transitionType: RouteTransitionType.fade,
        );
         case StringRoute.forget:
        return BaseRoute(
          page:  ForgotPasswordScreen(),
          transitionType: RouteTransitionType.fade,
        );
         case StringRoute.forget2:
        return BaseRoute(
          page: ForgotPasswordEmailScreen(),
          transitionType: RouteTransitionType.fade,
        );
         case StringRoute.verfication:
        return BaseRoute(
          page:  VerificationCodeScreen(),
          transitionType: RouteTransitionType.fade,
        );
        case StringRoute.verfication2:
  final args = settings.arguments;
  if (args != null && args is String) {
    return BaseRoute(
      page: VerificationemailScreen(email: args),
      transitionType: RouteTransitionType.fade,
    );
  } else {
    return BaseRoute(
      page: const Scaffold(
        body: Center(child: Text('Email not provided!')),
      ),
      transitionType: RouteTransitionType.fade,
    );
  }
         case StringRoute.congrate:
        return BaseRoute(
          page:  CongrateScreen(),
          transitionType: RouteTransitionType.fade,
        );
       case StringRoute.createnewPassword:
  final args = settings.arguments;
  if (args != null && args is String) {
    return BaseRoute(
      page: CreateNewPassword(email: args),
      transitionType: RouteTransitionType.fade,
    );
  } else {
    return BaseRoute(
      page: const Scaffold(
        body: Center(child: Text('Email not provided!')),
      ),
      transitionType: RouteTransitionType.fade,
    );
  }

case StringRoute.home:
        return BaseRoute(
          page:  HomeScreen(),
          transitionType: RouteTransitionType.fade,
        );
        case StringRoute.productlist:
        return BaseRoute(
          page:  ProductListScreen(),
          transitionType: RouteTransitionType.fade,
        );
        case StringRoute.search:
        return BaseRoute(
          page:  SearchScreen(),
          transitionType: RouteTransitionType.fade,
        );
        case StringRoute.bottomBar:
        return BaseRoute(
          page:  BottomBar(),
          transitionType: RouteTransitionType.fade,
        );

         case StringRoute.bestforyou:
        return BaseRoute(
          page:  BestForYouScreen(),
          transitionType: RouteTransitionType.fade,
        );
         case StringRoute.buyAgain:
        return BaseRoute(
          page:  BuyAgainScreen(),
          transitionType: RouteTransitionType.fade,
        );
         case StringRoute.popularProduct:
        return BaseRoute(
          page:  PopularProductScreen(),
          transitionType: RouteTransitionType.fade,
        );
         case StringRoute.favorite:
        return BaseRoute(
          page:  FavoriteScreen(),
          transitionType: RouteTransitionType.fade,
        );
      
      default:
        return BaseRoute(
          page: const Scaffold(),
          transitionType: RouteTransitionType.fade,
        );
    }
  }
}
