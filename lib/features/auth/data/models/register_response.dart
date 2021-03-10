import 'package:web_game/features/register/register.dart';

class RegisterResponse {
  final RegisterRequest request;
  final bool success;
  final String msg;
  RegisterResponse({
    this.request,
    this.success,
    this.msg,
  });
}
