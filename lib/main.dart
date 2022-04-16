import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_game/app.dart';
import 'package:shared/shared.dart';
import 'package:web_game/dummy_game_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.addPostFrameCallback((_) {});
  final _navigatorKey = GlobalKey<NavigatorState>();
  await setup();

  await Firebase.initializeApp();
  await GameInjector.injectRPGGame();
  await GameInjector.injectLetsCookingGame();
  BlocOverrides.runZoned(
    () {
      return runApp(
        UserProvider(
          child: AppConfigProvider(
            isProduction: false,
            navigatorKey: _navigatorKey,
            child: MultiBlocProvider(
              providers: BlocProviders().getProviders(),
              child: AppView(),
            ),
          ),
        ),
      );
    },
    blocObserver: CustomBlocObserver(),
  );
}
