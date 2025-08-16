import 'package:flutter_application_1/feature/auth/data/model/active_resent_request_model.dart';
import 'package:flutter_application_1/feature/auth/data/model/login_model.dart';
import 'package:flutter_application_1/feature/auth/data/model/login_request_model.dart';
import 'package:flutter_application_1/feature/auth/data/model/new_password_requst_model.dart';
import 'package:flutter_application_1/feature/auth/data/model/resent_reqest_Model.dart';
import 'package:flutter_application_1/feature/auth/data/model/sign_up_reques_modelt.dart';
import 'package:flutter_application_1/feature/auth/data/repo/auth_repository.dart';
import 'package:flutter_application_1/feature/auth/presentation/view_model/state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());
  final AuthRepository userRepository;
  LoginModel? user;

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    final response = await userRepository.signIn(
      LoginRequestModel(email: email, password: password),
    );
    response.fold(
      (errMessage) => emit(SignInFailure(errMessage: errMessage)),
      (signInModel) => emit(SignInSuccess(message: signInModel.message)),
    );
  }

  Future<void> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignUpLoading());
    final response = await userRepository.signUp(
      SignUpRequestModel(
        name: name,
        phone: phone,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
    response.fold(
      (errMessage) => emit(SignUpFailure(errMessage: errMessage)),
      (signUpModel) => emit(SignUpSuccess(message: signUpModel.message)),
    );
  }

  Future<void> resent({required String email}) async {
    emit(ResentLoading());
    final response = await userRepository.resentEmail(
      ResentReqestModel(email: email),
    );
    response.fold(
      (errMessage) => emit(ResentFailure(errMessage: errMessage)),
      (resentModel) => emit(ResentSuccess(message: resentModel.message)),
    );
  }

  Future<void> verification({required String email, required String code}) async {
    emit(VerificationLoading());
    final response = await userRepository.verification(
      ActiveResentRequestModel(email: email, code: code),
    );
    response.fold(
      (errMessage) => emit(VerificationFailure(errMessage: errMessage)),
      (verificationModel) => emit(VerificationSuccess(message: verificationModel.message)),
    );
  }

  Future<void> newPassword({required String email, required String password, required String confirmPassword}) async {
    emit(NewPasswordLoading());
    final response = await userRepository.newpassword(
      NewPasswordRequestModel(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
    response.fold(
      (errMessage) => emit(NewPasswordFailure(errMessage: errMessage)),
      (newPasswordModel) => emit(NewPasswordSuccess(message: newPasswordModel.message)),
    );
  }
}