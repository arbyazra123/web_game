import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:core/core.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({this.repository}) : super(LoginState());
  final AuthenticationRepository repository;
  String email;
  String password;
  String msg;
  User user;

  void onEmailChanged(String v) {
    final value = Email.dirty(v);
    email = value.value;
    emit(state.copyWith(
        email: value, status: Formz.validate([value, state.password])));
  }

  void onPasswordChanged(String v) {
    final value = Password.dirty(v);
    password = value.value;
    emit(state.copyWith(
        password: value, status: Formz.validate([value, state.password])));
  }

  void togglePasswordView() {
    emit(state.copyWith(
        isPasswordShown: !state.isPasswordShown,
        status: Formz.validate([state.email, state.password])));
  }

  void login(BuildContext context) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      var result = await repository.logInWithEmailAndPassword(
        context:context,
        email: email,
        password: password,
      );
      if (result.success) {
        
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
        emit(state.copyWith(status: FormzStatus.valid));
      } else {
        msg = result.msg;
        emit(state.copyWith(status: FormzStatus.submissionFailure));
        emit(state.copyWith(status: FormzStatus.valid));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
