import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/product_card.dart';
import 'package:flutter_application_1/feature/home/presentaion/view/home/widgets/section_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyAgainHome extends StatelessWidget {
  const BuyAgainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          SectionHeader(title: "Buy Again",onTap: () {
           context.pushName(StringRoute.buyAgain);
         },),
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 180.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ProductCard(
                          image: AssetManager.iphone,
                          name: "Sony Headphone",
                          price: "3499 LE",
                          rate: "4.0",
                          onTap: () {
                            
                          },
                        ),
                        ProductCard(
                          image: AssetManager.iphone,
                          name: "HP Laptop",
                          price: "9999 LE",
                          rate: "4.5",
                          onTap: () {},
                        ),
                       
                      ],
                    ),
                  ),
                 
      ],
    );
  }
}