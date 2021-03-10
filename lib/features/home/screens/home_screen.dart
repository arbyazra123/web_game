import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/screen_util.dart';
import 'package:web_game/components/components.dart';
import 'package:web_game/features/home/widgets/widgets.dart';
import 'package:web_game/shared/fonts.dart';
import 'package:web_game/shared/injector.dart';
import 'package:web_game/shared/shared.dart';

import '../../features.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => gi<GamesBloc>(),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(right:50),
                child: IconButton(
                  icon: Icon(
                    Icons.logout,
                  ),
                  onPressed: () =>gi<AuthBloc>().add(AuthenticationLogoutRequested()),
                ),
              )
            ],
            title: H2Atm(
              "Mroalla",
              align: TextAlign.center,
              style: TextStyle(
                fontFamily: metalista,
                color: AppColors.textColor,
              ),
            ),
          ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GamesWidget(),
              ],
            ),
          ),
        ));
  }
}
