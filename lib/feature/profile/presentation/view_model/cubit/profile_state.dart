part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileSuccess extends ProfileState {
  final ProfileModel profile;

  GetProfileSuccess({required this.profile});
}

final class GetProfileLoading extends ProfileState {}

final class GetProfileFailure extends ProfileState {
  final String error;

  GetProfileFailure({required this.error});
}
final class UploadImageSuccess extends ProfileState {
  final ProfileModel profile;

  UploadImageSuccess({required this.profile});
}
final class UploadImageLoading extends ProfileState {}
final class UploadImageFailure extends ProfileState {
  final String error;

  UploadImageFailure({required this.error});
}
