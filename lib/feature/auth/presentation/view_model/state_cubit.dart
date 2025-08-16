

sealed class UserState {}

final class UserInitial extends UserState {}

final class SignInSuccess extends UserState {
  final String message;

  SignInSuccess({required this.message});
}

final class UploadProfilePic extends UserState {}

final class SignInLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

final class SignUpSuccess extends UserState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
final class ResentSuccess extends UserState {
  final String message;

  ResentSuccess({required this.message});
}

final class ResentLoading extends UserState {}

final class ResentFailure extends UserState {
  final String errMessage;

  ResentFailure({required this.errMessage});
}
final class VerificationLoading extends UserState {}
final class VerificationSuccess extends UserState {
  final String message;

  VerificationSuccess({required this.message});
}
final class VerificationFailure extends UserState {
  final String errMessage;
  VerificationFailure({required this.errMessage});
}
final class NewPasswordLoading extends UserState {}
final class NewPasswordSuccess extends UserState {
  final String message;

  NewPasswordSuccess({required this.message});
}
final class NewPasswordFailure extends UserState {
  final String errMessage;
  NewPasswordFailure({required this.errMessage});
}
 

