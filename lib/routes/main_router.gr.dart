// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'main_router.dart';

class _$MainRouter extends RootStackRouter {
  _$MainRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      final args = routeData.argsAs<WelcomeRouteArgs>(
          orElse: () => const WelcomeRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WelcomePage(key: args.key, navigatorKey: args.navigatorKey));
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(routeData: routeData, child: LoginPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(routeData: routeData, child: HomePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(WelcomeRoute.name, path: '/'),
        RouteConfig(LoginRoute.name, path: '/login'),
        RouteConfig(HomeRoute.name, path: '/home')
      ];
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({Key key, GlobalKey<NavigatorState> navigatorKey})
      : super(WelcomeRoute.name,
            path: '/',
            args: WelcomeRouteArgs(key: key, navigatorKey: navigatorKey));

  static const String name = 'WelcomeRoute';
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({this.key, this.navigatorKey});

  final Key key;

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}
