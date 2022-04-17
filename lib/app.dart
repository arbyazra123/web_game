import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lets_cook/lets_cook.dart';
import 'package:rpg/main_rpg.dart';
import 'package:rpg/routes/rpg_router.dart';
import 'package:viewport/viewport.dart';
import 'package:web_game/injector.dart';
import 'package:web_game/routes/main_router.dart';
import 'features/features.dart';
import 'package:shared/shared.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';

class AppView extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with WidgetsBindingObserver {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewPortWidget.fixed(
      width: 470,
      height: 690,
      child: MaterialApp.router(
        routerDelegate: mainGi.get<MainRouter>().delegate(),
        routeInformationParser: mainGi.get<MainRouter>().defaultRouteParser(),
        title: 'Flutter Demo',
        theme: LightTheme.themeData,
        builder: (context, child) {
          // return GameInjector();
          return _App(
            child: child,
            navigator: _navigatorKey,
          );
        },
        // home: RPGApp(
        //   gameId: "rpg",
        // ),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('id', 'ID'),
        ],
        localeResolutionCallback:
            (Locale locale, Iterable<Locale> supportedLocales) {
          if (locale == null) {
            debugPrint("*language locale is null!!!");
            return supportedLocales.first;
          }

          for (Locale supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode ||
                supportedLocale.countryCode == locale.countryCode) {
              debugPrint("*language ok $supportedLocale");
              handleLangChanges(context, supportedLocale.languageCode);
              return supportedLocale;
            } else {
              debugPrint("*language is not ok $supportedLocale");
              handleLangChanges(context, "en");
            }
          }

          debugPrint("*language to fallback ${supportedLocales.first}");
          return supportedLocales.first;
        },
      ),
    );
  }

  Future<void> handleLangChanges(BuildContext context, String langCode) async {
    context
        .read<LanguageBloc>()
        .add(OnChangeLanguage(context: context, langCode: langCode));
  }
}

class _App extends StatefulWidget {
  final GlobalKey<NavigatorState> navigator;
  final Widget child;
  const _App({Key key, this.navigator, this.child}) : super(key: key);
  @override
  __AppState createState() => __AppState();
}

class __AppState extends State<_App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        if (state is LanguageLoaded) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthStatus.authenticated:
                  UserProvider.of(context).user = state.user;
                  mainGi.get<MainRouter>().replace(HomeRoute());
                  break;
                case AuthStatus.unauthenticated:
                  UserProvider.of(context).user = null;
                  mainGi.get<MainRouter>().replace(LoginRoute());
                  break;
                default:
                  break;
              }
            },
            child: widget.child,
          );
        }
        return WelcomePage();
      },
    );
  }
}
