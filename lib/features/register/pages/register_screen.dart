import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:components/components.dart';
import 'package:shared/shared.dart';
import 'package:formz/formz.dart';
import 'package:core/core.dart';
import 'package:web_game/features/features.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterCubit(repository: gi<AuthenticationRepository>()),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state.status.isSubmissionInProgress) {
              Utils.showLoadingDialog(context);
            }
            if (state.status.isSubmissionFailure) {
              Navigator.pop(context);
              var msg = context.read<RegisterCubit>().msg;
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
                    content: H3Atm(
                        "Berhasil Mendaftar!, mengalihkan ke halaman login..."),
                  ))
                  .closed
                  .then((value) {
              });
            }
          },
          child: RegisterForm(
            scaffoldKey: scaffoldKey,
          ),
        ),
      ),
    );
  }
}
