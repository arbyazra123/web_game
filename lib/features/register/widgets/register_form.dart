import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/screen_util.dart';
import 'package:components/components.dart';
import 'package:shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:formz/formz.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const RegisterForm({Key key, this.scaffoldKey}) : super(key: key);
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  RegisterCubit _bloc;
  RegisterState _state;
  @override
  void initState() {
    super.initState();
    _bloc = context.read<RegisterCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        _state = state;
        return _buildBody();
      },
    );
  }

  String _emailErrorText(RegisterState state) =>
      state.email.valid ? null : translate(context, "email_isnt_valid");

  String _usernameErrorText(RegisterState state) =>
      state.username.valid ? null : translate(context, "username_isnt_valid");

  String _passwordErrorText(RegisterState state) =>
      state.password.valid ? null : translate(context, "password_isnt_valid");

  void _onRegisterTap() async{
    // print(_bloc.isFormValid);
    if (!_state.status.isValidated) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: H3Atm("Cek kolom yang belum Anda isi"),
      ));
      return;
    }
    _bloc.register(context);
  }

  Center _buildBody() {
    return Center(
      child: Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            H4Atm(
              "Start your journey with",
              align: TextAlign.center,
              style: TextStyle(color: Colors.red[800]),
            ),
            H1Atm(
              "Mroalla",
              align: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryColor, fontFamily: metalista),
            ),
            SizedBox(height: 25),
            DefaultTextFieldAtm(
              hasOutlineBorder: true,
              hintText: "Username",
              errorText: _usernameErrorText(_state),
              onChanged: (value) => _bloc.onUsernameChanged(value),
            ),
            SizedBox(height: 10),
            DefaultTextFieldAtm(
              hasOutlineBorder: true,
              hintText: "Email",
              errorText: _emailErrorText(_state),
              onChanged: (value) => _bloc.onEmailChanged(value),
            ),
            SizedBox(height: 10),
            DefaultTextFieldAtm(
              hasOutlineBorder: true,
              hintText: "Password",
              errorText: _passwordErrorText(_state),
              onChanged: (value) => _bloc.onPasswordChanged(value),
              suffixIcon: IconButton(
                icon: Icon(!_state.isPasswordShown
                    ? Icons.visibility_off
                    : Icons.visibility),
                onPressed: () => _bloc.togglePasswordView(),
              ),
              isObscure: !_state.isPasswordShown,
            ),
            SizedBox(height: 10),
            DefaultTextFieldAtm(
              hasOutlineBorder: true,
              hintText: "Age (optional)",
              onChanged: (value) => _bloc.onAgeChanged(value),
            ),
            SizedBox(height: 25),
            DefaultButtonMol(
              text: "REGISTER",
              onClick: _onRegisterTap,
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: H5Atm(
                "Login",
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
