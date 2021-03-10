import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_game/app.dart';
import 'package:web_game/shared/injector.dart';
import 'shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.addPostFrameCallback((_) {});
  final _navigatorKey = GlobalKey<NavigatorState>();
  await setup();
  
  await Firebase.initializeApp();
  runApp(
    AppConfigProvider(
      isProduction: false,
      navigatorKey: _navigatorKey,
      child: MultiBlocProvider(
        providers: BlocProviders().getProviders(),
        child: AppView(),
      ),
    ),
  );
}
