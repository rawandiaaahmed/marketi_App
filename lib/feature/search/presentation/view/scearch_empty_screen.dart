// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/core/Router/route_string.dart';
// import 'package:flutter_application_1/core/constants/app_string.dart';
// import 'package:flutter_application_1/core/constants/asset_manager.dart';
// import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
// import 'package:flutter_application_1/core/theme/app_colors.dart';
// import 'package:flutter_application_1/core/theme/app_style.dart';
// import 'package:flutter_application_1/feature/home/presentaion/view/widgets/search_home.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SearchEmptyScreen extends StatelessWidget {
//   const SearchEmptyScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             InkWell(
//               onTap: () => Navigator.pop(context),
//               child: Image.asset(AssetManager.back),
//             ),

//             CircleAvatar(
//               radius: 18.r,
//               backgroundImage: const NetworkImage(
//                 "https://i.pravatar.cc/150?img=3",
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SearchHome(
//                 onTap: () {
//                   context.pushName(StringRoute.productlist);
//                 },
//               ),
//               SizedBox(height: 20.h),
//               Padding(
//             padding: EdgeInsets.all(16.w),
//             child: Padding(
//               padding: EdgeInsets.only(top: 70.h),
//               child: Column(
//                 children: [
                         
         
                    
//               Image.asset(AssetManager.cartimage, height: 200.h),
//             SizedBox(height: 20.h),
//            Text('Oops Not Found',style: AppStyles.congrateLines2Style,),

//             SizedBox(height: 25.h),
//              Padding(
//                padding:  EdgeInsets.only(right: 26.h,left: 18.h),
//                child: Text('Check our big offers, fresh products and fill your cart with items',style: AppStyles.congrate2Lines2Style,),
//              ),
//                SizedBox(height: 25.h),
//               ElevatedButton(
//                     onPressed: () { context.pushName(StringRoute.cart);},
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(double.infinity, 50.h),
//                       backgroundColor: AppColors.darkblue100,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12.r),
//                       ),
//                     ),
//                     child: Text(AppStrings.startShopping, style: AppStyles.primaryHeadLinesStyle,),
//                   ),
//                 ]
//               )
//             )
//           )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }