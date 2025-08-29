import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/constants/app_string.dart';

import 'package:flutter_application_1/feature/cart/presentation/view/product_cart_screen.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view/favorite_screen.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home_screen.dart';

import 'package:flutter_application_1/feature/profile/presentation/view/prifile_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selected = 0;

  final List<Widget> pages = [
     HomeScreen(),
    ProductCartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        onTap: onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AssetManager.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetManager.cart),
            label: AppStrings.cart,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetManager.favorites),
            label: AppStrings.favorites,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppStrings.profile,
          ),
        ],
      ),
    );
  }
}
