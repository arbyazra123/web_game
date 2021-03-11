part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final Name username;
  final Email email;
  final Password password;
  final Age age;
  final bool isPasswordShown;
  final FormzStatus status;

  RegisterState({
    this.status = FormzStatus.pure,
    this.username = const Name.pure(),
    this.email=const Email.pure(),
    this.password=const Password.pure(),
    this.age = const Age.pure(),
    this.isPasswordShown=false,
  });

  copyWith({
    username,
    email,
    password,
    age,
    status,
    isPasswordShown,
  }) =>
      RegisterState(
          username: username ?? this.username,
          email: email ?? this.email,
          password: password ?? this.password,
          age: age ?? this.age,
          isPasswordShown: isPasswordShown ?? this.isPasswordShown,
          status: status ?? this.status);

  @override
  List<Object> get props => [
        username,
        email,
        password,
        age,
        status,
        isPasswordShown,
      ];
}
