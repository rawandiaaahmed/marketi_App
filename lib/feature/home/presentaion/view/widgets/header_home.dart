import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_style.dart';
import 'package:flutter_application_1/feature/profile/presentation/view_model/cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        } else if (state is UploadImageFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        } else if (state is UploadImageSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile image updated successfully")),
          );
        }
      },
      builder: (context, state) {
        return  state is GetProfileLoading
              ? const Center(child: CircularProgressIndicator())
              : state is GetProfileSuccess
                  ?  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(AssetManager.homeimage),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        state.profile.name,
                        style: AppStyles.namehomeHeadLinesStyle,
                      ),
                      const Spacer(),
                      const Icon(Icons.notifications_outlined, size: 28),
                    ],
                  ) : Container();
  }
    
      
    );
  }
}