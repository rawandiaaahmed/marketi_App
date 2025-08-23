import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/extensions/shimmer.dart';



class ProductLoadingWidget extends StatelessWidget {
  const ProductLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
mainAxisAlignment: MainAxisAlignment. center,
 children: [ 
  Center(
    child: ClipRRect(
    borderRadius: BorderRadius.circular(4),
     child: Container( 
    height: 32,
     width:240,
    color: Colors. grey [400],
    ).withShimmer()
    ),
  ),

 
 ]
);
  }
}