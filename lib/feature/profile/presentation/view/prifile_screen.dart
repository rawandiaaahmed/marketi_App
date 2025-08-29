import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/helper/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_application_1/core/constants/app_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';

import 'package:flutter_application_1/feature/profile/presentation/view/widgets/profile_widge.dart';
import 'package:flutter_application_1/feature/profile/presentation/view_model/cubit/profile_cubit.dart';
import 'package:flutter_application_1/feature/profile/presentation/view_model/cubit/them_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      context.read<ProfileCubit>().uploadImage(File(image.path));
    }
  }

  @override
  void initState() {
    context.read<ProfileCubit>().getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetProfileFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is UploadImageFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is UploadImageSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile image updated successfully")),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: isDarkMode ? AppColors.black : Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: isDarkMode ? AppColors.black : Colors.white,
            title: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    AssetManager.back,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(width: 80.w),
                Text(
                  AppStrings.myProfile,
                  style: AppStyles.namehomeHeadLinesStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  AssetManager.cart,
                  color: isDarkMode ? Colors.white : AppColors.darkblue100,
                ),
              ],
            ),
          ),
          body: state is GetProfileLoading
              ? const Center(child: CircularProgressIndicator())
              : state is GetProfileSuccess
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 50.r,
                              backgroundImage: state.profile.image.isNotEmpty
                                  ? NetworkImage(state.profile.image)
                                  : const AssetImage(
                                          "assets/images/placeholder.png",
                                        )
                                        as ImageProvider,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () => _pickImage(context),
                                child: CircleAvatar(
                                  radius: 15.r,
                                  backgroundColor: AppColors.lightBlue100,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        state.profile.name,
                        style: AppStyles.onboarderHeadLinesStyle.copyWith(
                          fontSize: 18.sp,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        state.profile.email,
                        style: AppStyles.details2Lines2Style.copyWith(
                          fontSize: 14.sp,
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      ProfileOption(
                        image: AssetManager.user,
                        title: 'Account Preferences',
                        isDarkMode: isDarkMode,
                        onTap: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AssetManager.mode,
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  'Dark Mode',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                              value: isDarkMode,
                              onChanged: (val) {
                                context.read<ThemeCubit>().toggleTheme(val);
                              },
                              activeColor: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                      ProfileOption(
                        image: AssetManager.ratep,
                        title: 'Rate Us',
                        isDarkMode: isDarkMode,
                        onTap: () {},
                      ),
                      ProfileOption(
                        image: AssetManager.feedback,
                        title: 'Provide Feedback',
                        isDarkMode: isDarkMode,
                        onTap: () {},
                      ),
                      ProfileOption(
                        image: AssetManager.logout,
                        title: 'Log Out',
                        isDarkMode: isDarkMode,
                        onTap: () async {
                          await CacheHelper().removeData(key: 'token');

                          context.pushName(StringRoute.signin);
                        },
                      ),
                    ],
                  ),
                )
              : Container(),
        );
      },
    );
  }
}
