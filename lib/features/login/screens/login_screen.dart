import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_game/features/login/widgets/widgets.dart';
import 'package:formz/formz.dart';
import 'package:components/components.dart';
import 'package:shared/shared.dart';
import 'package:core/core.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(repository: gi<AuthenticationRepository>()),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status.isSubmissionInProgress) {
              Utils.showLoadingDialog(context);
            }
            if (state.status.isSubmissionFailure) {
              Navigator.pop(context);
              var msg = context.read<LoginCubit>().msg;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 3),
                content: H3Atm(
                  msg ?? "Suatu kesalahan telah terjadi, maaf",
                ),
              ));
            }
            if (state.status.isSubmissionSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(
                    content: H3Atm("Berhasil Login!"),
                  ))
                  .closed
                  .then((value) {
                    
                  });
            }
          },
          child: LoginForm(
            scaffoldKey: scaffoldKey,
          ),
        ),
      ),
    );
  }
}
