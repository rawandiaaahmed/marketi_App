import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/feature/profile/data/model/profile_model.dart';
import 'package:flutter_application_1/feature/profile/data/repo/profile_repository.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userRepository) : super(ProfileInitial());
  final ProfileRepository userRepository;

  getUserProfile() async {
   
    emit(GetProfileLoading());
    final response = await userRepository.getUserProfile();
    
    response.fold(
      (errMessage) => emit(GetProfileFailure(error: errMessage)),
      (profile) => emit(GetProfileSuccess(profile: profile)),
    );
  }

  uploadImage(File imageFile) async {
   
    if (state is GetProfileSuccess) {
      final userId = (state as GetProfileSuccess).profile.id;
      emit(GetProfileLoading());
      final response = await userRepository.uploadProfileImage(
        userId: userId,
        imageFile: imageFile,
      );
     
      response.fold(
        (errMessage) => emit(GetProfileFailure(error: errMessage)),
        (profile) => emit(GetProfileSuccess(profile: profile)),
      );
    }
  }
}