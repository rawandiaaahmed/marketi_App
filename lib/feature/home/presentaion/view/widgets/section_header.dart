// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/theme/app_style.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: AppStyles.onboarderHeadLinesStyle),
        InkWell(
          onTap: onTap,
          child: Text("View all",
              style: AppStyles.viewLines2Style),
        ),
      ],
    );
  }
}
