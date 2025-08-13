import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/auth/data/model/login_model.dart';
import 'package:flutter_application_1/feature/auth/data/repo/user_repository.dart';

import 'state_cubit.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());
  final UserRepository userRepository;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //  TextEditingController userName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController resentEmail = TextEditingController();
  GlobalKey<FormState> resentFormKey = GlobalKey();


  TextEditingController verificationEmail = TextEditingController();
  TextEditingController code = TextEditingController();
  GlobalKey<FormState> verificationFormKey = GlobalKey();

  TextEditingController newpasswordEmail = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController newpasswordConfirm = TextEditingController();
  GlobalKey<FormState> newpasswordFormKey = GlobalKey();
  LoginModel? user;

  signIn() async {
    emit(SignInLoading());
    final response = await userRepository.signIn(
      email: signInEmail.text,
      password: signInPassword.text,
    );
    response.fold(
      (errMessage) => emit(SignInFailure(errMessage: errMessage)),
      (signInModel) => emit(SignInSuccess()),
    );
  }

  signUp() async {
    emit(SignUpLoading());
    final response = await userRepository.signUp(
      name: signUpName.text,
      phone: signUpPhoneNumber.text,
      email: signUpEmail.text,
      password: signUpPassword.text,
      confirmPassword: confirmPassword.text,
    );
    response.fold(
      (errMessage) => emit(SignUpFailure(errMessage: errMessage)),
      (signUpModel) => emit(SignUpSuccess(message: signUpModel.message)),
    );
  }

  resent() async {
    emit(ResentLoading());
    final response = await userRepository.resentEmail(email: resentEmail.text);
    print(response);
    response.fold(
      (errMessage) => emit(ResentFailure(errMessage: errMessage)),
      (resentModel) => emit(ResentSuccess(message: resentModel.message)),
    );
  }
  verification() async {
    emit(VerificationLoading());
    final response = await userRepository.verification(
      email: resentEmail.text,
      code: code.text,
    );
    print(response);
    response.fold(
      (errMessage) => emit(VerificationFailure(errMessage: errMessage)),
      (verificationModel) => emit(VerificationSuccess(message: verificationModel.message)),
    );
  }
   newsPassword() async {
    emit(NewPasswordLoading());
    final response = await userRepository.newpassword(
      email: newpasswordEmail.text,
      password: newpassword.text,
      confirmPassword: newpasswordConfirm.text,
    );
    print(response);
    response.fold(
      (errMessage) => emit(NewPasswordFailure(errMessage: errMessage)),
      (newPasswordModel) => emit(NewPasswordSuccess(message: newPasswordModel.message)),
    );
  }

   
  

}
