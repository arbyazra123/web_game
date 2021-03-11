part of 'login_cubit.dart';

class LoginState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;
  final bool isPasswordShown;

  LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.isPasswordShown = false,
  });

  copyWith({email, password, status, isPasswordShown}) => LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        isPasswordShown: isPasswordShown ?? this.isPasswordShown,
      );

  @override
  List<Object> get props => [
        email,
        password,
        status,
        isPasswordShown,
      ];
}
