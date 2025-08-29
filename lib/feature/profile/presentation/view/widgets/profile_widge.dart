import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';

class ProfileOption extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  final bool isDarkMode;
  final Color? iconColor;

  const ProfileOption({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.isDarkMode,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image, color: iconColor ?? (isDarkMode ? Colors.white : Colors.black)),
      title: Text(
        title,
        style: AppStyles.profileLines2Style.copyWith(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      trailing: Image.asset(AssetManager.vendor3, color: isDarkMode ? Colors.white : Colors.black),
      onTap: onTap,
    );
  }
}