import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_game/routes/routes.dart';

import '../features/features.dart';
part 'main_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: MainRoutes.splash,
      page: WelcomePage,
      initial: true,
    ),
    AutoRoute(
      path: MainRoutes.login,
      page: LoginPage,
    ),
    AutoRoute(
      path: MainRoutes.home,
      page: HomePage,
    ),
  ],
)
class MainRouter extends _$MainRouter {}
