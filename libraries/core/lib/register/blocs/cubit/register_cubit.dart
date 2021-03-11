import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:core/core.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({this.repository}) : super(RegisterState());
  final AuthenticationRepository repository;
  String msg;
  RegisterRequest registerRequest = RegisterRequest();
  List<FormzInput> fieldz(FormzInput xs) => xs == null
      ? [
          state.email,
          state.username,
          state.password,
          state.age,
        ].toList()
      : [
          state.email,
          state.username,
          state.password,
          state.age,
        ].where((element) {
          if (element.hashCode == xs.hashCode) {
            element = xs;
            return true;
          } else {
            return true;
          }
        }).toList();

  void onUsernameChanged(String v) {
    final value = Name.dirty(v);
    registerRequest.username = value.value;
    emit(
        state.copyWith(username: value, status: Formz.validate(fieldz(value))));
  }

  void onEmailChanged(String v) {
    final value = Email.dirty(v);
    registerRequest.email = value.value;
    emit(state.copyWith(email: value, status: Formz.validate(fieldz(value))));
  }

  void onPasswordChanged(String v) {
    final value = Password.dirty(v);
    registerRequest.password = value.value;
    emit(
        state.copyWith(password: value, status: Formz.validate(fieldz(value))));
  }

  void onAgeChanged(String v) {
    final value = Age.dirty(v);
    registerRequest.password = value.value;
    emit(state.copyWith(age: value, status: Formz.validate(fieldz(value))));
  }

  void togglePasswordView() {
    emit(state.copyWith(
        isPasswordShown: !state.isPasswordShown,
        status: Formz.validate(fieldz(null))));
  }

  void register(BuildContext context) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      RegisterResponse result =
          await repository.signUp(context: context, request: registerRequest);
      if (result == null) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
        emit(state.copyWith(status: FormzStatus.valid));
        return;
      }
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
