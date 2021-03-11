import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/screen_util.dart';
import 'package:viewport/viewport.dart';
import 'package:web_game/features/register/pages/register_screen.dart';
import 'package:components/components.dart';
import 'package:shared/shared.dart';
import 'package:formz/formz.dart';
import 'package:core/core.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const LoginForm({
    Key key,
    this.scaffoldKey,
  }) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginCubit _bloc;
  LoginState _state;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<LoginCubit>();
  }

  String _emailErrorText(LoginState state) =>
      state.email.valid ? null : translate(context, "email_isnt_valid");

  String _passwordErrorText(LoginState state) =>
      state.password.valid ? null : translate(context, "password_isnt_valid");

  void _onLoginTap() async {
    // print(_bloc.isFormValid);
    if (!_state.status.isValidated) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: H3Atm("Cek kolom yang belum Anda isi"),
      ));
      return;
    }
    _bloc.login(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        _state = state;
        return _buildBody(context, state);
      },
    );
  }

  Center _buildBody(BuildContext context, LoginState state) {
    print(ViewPort.of(context).width);
    return Center(
      child: Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            H1Atm(
              "Mroalla",
              align: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryColor, fontFamily: metalista),
            ),
            SizedBox(height: 25),
            DefaultTextFieldAtm(
              hasOutlineBorder: true,
              hintText: "Email",
              errorText: _emailErrorText(state),
              onChanged: (value) => _bloc.onEmailChanged(value),
            ),
            SizedBox(height: 10),
            DefaultTextFieldAtm(
              hasOutlineBorder: true,
              hintText: "Password",
              errorText: _passwordErrorText(state),
              onChanged: (value) => _bloc.onPasswordChanged(value),
              suffixIcon: IconButton(
                icon: Icon(
                  !_state.isPasswordShown
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () => _bloc.togglePasswordView(),
              ),
              isObscure: !_state.isPasswordShown,
            ),
            SizedBox(height: 25),
            DefaultButtonMol(
              text: "LOGIN",
              onClick: _onLoginTap,
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                Navigator.push(context, RegisterScreen().route());
              },
              child: H5Atm(
                "Register",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
