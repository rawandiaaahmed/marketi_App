import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/get_it/injection_sl.dart';
import 'package:flutter_application_1/core/widget/bottom_bar.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/forget_password/congrate_screen.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/forget_password/create_new_password.dart';

import 'package:flutter_application_1/feature/auth/presentation/view/forget_password/forgot_password_email_screen.dart';

import 'package:flutter_application_1/feature/auth/presentation/view/forget_password/verification_email_screen.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/login/sign_in_screen.dart';
import 'package:flutter_application_1/feature/auth/presentation/view/sign_up/sign_up_screen.dart';
import 'package:flutter_application_1/feature/cart/data/model/cart_items_model.dart';
import 'package:flutter_application_1/feature/cart/presentation/view/cart_screen.dart';
import 'package:flutter_application_1/feature/cart/presentation/view/product_cart_screen.dart';
import 'package:flutter_application_1/feature/cart/presentation/view/widgets/cart_details_screen.dart';
import 'package:flutter_application_1/feature/favorite/data/model/favorite_model.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view/favorite_details_screen.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view/favorite_screen.dart';
import 'package:flutter_application_1/feature/home/data/model/product_model.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/brands_view_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/category_view_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/popular_product_view_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/product_by_brand_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/product_by_category_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/product_details_screen.dart';
import 'package:flutter_application_1/feature/profile/presentation/view/prifile_screen.dart';
import 'package:flutter_application_1/feature/search/data/model/search_model.dart';
import 'package:flutter_application_1/feature/search/presentation/view/product_list_screen.dart';
import 'package:flutter_application_1/feature/search/presentation/view/search_details.dart';
import 'package:flutter_application_1/feature/search/presentation/view/search_screen.dart';
import 'package:flutter_application_1/feature/onboarding/view/onboarding_screen.dart';
import 'package:flutter_application_1/feature/splash/view/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/presentaion/view_model/cubit/home_cubit.dart';
import '../../feature/profile/presentation/view_model/cubit/profile_cubit.dart';
import '../../feature/search/presentation/view_model/cubit/search_cubit.dart';
import '../../feature/cart/presentation/view_model/cubit/cart_cubit.dart';
import '../../feature/favorite/presentation/view_model/cubit/favorite_cubit.dart';

import 'base_routes.dart';
import 'route_string.dart';

class AppRoutes {
  static Route<void> onGenerateRoute(RouteSettings settings) {
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
          page: SignInScreen(),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.signUp:
        return BaseRoute(
          page: SignUpScreen(),
          transitionType: RouteTransitionType.fade,
        );

     

      case StringRoute.forget2:
        return BaseRoute(
          page: ForgotPasswordEmailScreen(),
          transitionType: RouteTransitionType.fade,
        );

     

      case StringRoute.getcategorybyproduct:
        final args = settings.arguments;
        if (args != null && args is String) {
          return BaseRoute(
            page: ProductByCategoryScreen(category: args),
            transitionType: RouteTransitionType.fade,
          );
        }
        return _errorPage("Category not provided!");

      case StringRoute.getbrandsbyproduct:
        final args = settings.arguments;
        if (args != null && args is String) {
          return BaseRoute(
            page: ProductByBrandScreen(brand: args),
            transitionType: RouteTransitionType.fade,
          );
        }
        return _errorPage("Brand not provided!");

      case StringRoute.verfication2:
        final args = settings.arguments;
        if (args != null && args is String) {
          return BaseRoute(
            page: VerificationemailScreen(email: args),
            transitionType: RouteTransitionType.fade,
          );
        }
        return _errorPage("Email not provided!");

      case StringRoute.congrate:
        return BaseRoute(
          page: CongrateScreen(),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.createnewPassword:
        final args = settings.arguments;
        if (args != null && args is String) {
          return BaseRoute(
            page: CreateNewPassword(email: args),
            transitionType: RouteTransitionType.fade,
          );
        }
        return _errorPage("Email not provided!");

      case StringRoute.home:
        return BaseRoute(
          page: MultiBlocProvider(
            providers: [
        BlocProvider(create: (_) => sl<SearchCubit>()),
        BlocProvider(create: (_) => sl<HomeCubit>()),
          BlocProvider(create: (_) => sl<ProfileCubit>()),
      ],
           
            child: HomeScreen(),
          ),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.productlist:
        return BaseRoute(
          page: ProductListScreen(),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.search:
        return BaseRoute(
          page: BlocProvider(
            create: (_) => sl<SearchCubit>(),
            child: SearchScreen(),
          ),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.bottomBar:
        return BaseRoute(
          page: BottomBar(),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.popularProduct:
        return BaseRoute(
          page: PopularProductScreen(),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.favorite:
        return BaseRoute(
          page: BlocProvider(
            create: (_) => sl<FavoriteCubit>(),
            child: FavoriteScreen(),
          ),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.cartempty:
        return BaseRoute(
          page: CartScreen(),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.category:
        return BaseRoute(
          page: CategoryScreen(),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.brands:
        return BaseRoute(
          page: BrandsScreen(),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.cart:
        return BaseRoute(
          page: BlocProvider(
            create: (_) => sl<CartCubit>(),
            child: ProductCartScreen(),
          ),
          transitionType: RouteTransitionType.fade,
        );

      case StringRoute.productDetails:
        final args = settings.arguments;
        if (args != null && args is ProductModel ) {
          return BaseRoute(
            page: ProductDetailsScreen(product: args),
            transitionType: RouteTransitionType.fade,
          );
        }
        return _errorPage("Product not provided!");


 case StringRoute.detalsSearch:
        final args = settings.arguments;
        if (args != null && args is ProductSearch ) {
          return BaseRoute(
            page: SearchDetailsScreen(search: args),
            transitionType: RouteTransitionType.fade,
          );
        }
        return _errorPage("Product not provided!");
         case StringRoute.detalsFavorite:
        final args = settings.arguments;
        if (args != null && args is FavoriteModel ) {
          return BaseRoute(
            page: FavoriteDetailsScreen(favorite: args),
            transitionType: RouteTransitionType.fade,
          );
        }
        return _errorPage("Product not provided!");


        case StringRoute.detalscart:
        final args = settings.arguments;
        if (args != null && args is CartModel ) {
          return BaseRoute(
            page: cartDetailsScreen(cart: args),
            transitionType: RouteTransitionType.fade,
          );
        }
        return _errorPage("Product not provided!");
      case StringRoute.profile:
        return BaseRoute(
          page: BlocProvider(
            create: (_) => sl<ProfileCubit>(),
            child: ProfileScreen(),
          ),
          transitionType: RouteTransitionType.fade,
        );

      default:
        return _errorPage("Page not found!");
    }
  }

  static BaseRoute _errorPage(String message) {
    return BaseRoute(
      page: Scaffold(
        body: Center(child: Text(message)),
      ),
      transitionType: RouteTransitionType.fade,
    );
  }
}